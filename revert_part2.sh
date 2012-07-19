#! /bin/bash

# Place a copy of a database that has the fields updated in
# /sites/default and call it site-db-part1.sql

TODAY=`date "+%Y%m%d"`-`date +%H%M%S`
echo "Today is $TODAY if you were wondering..."
echo

echo "drop database"
echo
drush sql-drop -y
echo

echo "Import d7 database at point where fields were converted."
echo
drush sqlc < site-db-part1.sql
echo

LOGIN=`drush uli`
echo "Login link:"
echo "$LOGIN"
echo

echo "[done]"
