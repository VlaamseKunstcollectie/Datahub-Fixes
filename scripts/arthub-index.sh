#!/bin/bash

usage() {
	echo "Usage: $0 -e <string> -l <string>" 1>&2;
	exit 1;
}

while getopts ":e:l:" o; do
    case "${o}" in
        e)
            e="${OPTARG}"
            ;;
        l)
            l="${OPTARG}"
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${e}" -o -z "${l}" ]; then
    usage
fi

lang="nl"

if [ ! -f "${l}" -o ! -r "${l}" ]; then
	if [[ "$l" =~ ^[a-z]{2,3}$ ]]; then
		lang=$l;
		l="../datahub-oai-to-blacklight-solr-${l}.fix"
		if [ ! -f "${l}" -o ! -r "${l}" ]; then
			echo "The fix file ${l} does not exist or is not readable."
			exit 1
		fi
	else
		echo "The fix file ${l} does not exist or is not readable."
		exit 1
    fi
fi

# Fetch data from the OAI endpoint

echo "Fetching data"
catmandu convert OAI --url "$e" --handler lido to JSON --fix "$l" > /tmp/bulk.json

# Fetch XML raw data from the OAI endpoint and add it to the JSON blob.

echo "Fetching XML"
perl process.pl $e > "/tmp/bulk_raw_${lang}.json"

echo "]" >> "/tmp/bulk_raw_${lang}.json"

# Cleans out the dataset. All records without an 'id' field are purged.

cp "/tmp/bulk_raw_${lang}.json" "/tmp/bulk_unfiltered_${lang}.json"
catmandu convert JSON to JSON --fix "select all_match(id, '.*\S.*')" < "/tmp/bulk_unfiltered_${lang}.json" > "/tmp/bulk_raw_${lang}.json"
rm "/tmp/bulk_unfiltered_${lang}.json"
