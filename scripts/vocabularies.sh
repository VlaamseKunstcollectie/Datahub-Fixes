#!/bin/bash

echo "Generating Persistent URL vocabulary.";
catmandu import CSV to DBI --data_source dbi:SQLite:/tmp/import.PIDS_ALL_UTF8.sqlite < ~/workspace/authority-files/PIDS_ALL_UTF8.csv

echo "Generating Rights vocabulary.";
catmandu import CSV to DBI --data_source dbi:SQLite:/tmp/import.RIGHTS.sqlite < ~/workspace/authority-files/RIGHTS.csv

echo "Generating Creators vocabulary.";
catmandu import CSV to DBI --data_source dbi:SQLite:/tmp/import.CREATORS_UTF8.sqlite < ~/workspace/authority-files/CREATORS_UTF8.csv

echo "Generating AAT vocabulary.";
catmandu import CSV to DBI --data_source dbi:SQLite:/tmp/import.AAT_UTF8.sqlite < ~/workspace/authority-files/AAT_UTF8.csv

echo "Generating CA vocabulary.";
catmandu import CSV to DBI --data_source dbi:SQLite:/tmp/import.CA_UTF8.sqlite < ~/workspace/authority-files/CA_UTF8.csv