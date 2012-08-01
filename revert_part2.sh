#! /bin/bash

# Place a copy of a database that has the fields updated in
# /sites/default and call it site-db-part1.sql

TODAY=`date "+%Y%m%d"`-`date +%H%M%S`
echo "Today is $TODAY if you were wondering..."
echo

#drush sql-dump --skip-tables-key=common > $TODAY.sql

echo "drop database"
echo
drush sql-drop -y
echo

echo "Import d7 database at point where fields were converted."
echo "sites/default/site-db-part1b.sql"
echo
drush sqlc < site-db-part1b.sql
echo

#echo "Git pull."
#git pull
#cd ../../
#git submodule update
#cd sites/default
echo

LOGIN=`drush uli`
echo "Login link:"
echo "$LOGIN"
echo

echo "[done]"
