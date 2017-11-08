#/bin/bash

echo "Fetching data"
catmandu convert OAI --url http://datahub.box/oai --handler lido  to JSON --fix ../datahub-oai-to-blacklight-solr.fix > /tmp/bulk.json

echo "Fetching XML"
perl process.pl > /tmp/bulk_raw.json

echo "]" >> /tmp/bulk_raw.json

echo "Pushing data"
dhconveyor index -p ../pipelines/arthub.ini -v