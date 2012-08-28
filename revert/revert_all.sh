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

echo "Copying d6 settings to settings.php"
#sudo cp settings-d6.php settings.php
cp settings-d6.php settings.php
echo

echo "Checking out master."
#sudo su gituser -c "git checkout master"
git checkout master
echo

echo "Importing d6 database."
drush sqlc < site-db-d6.sql
echo

echo "Clearing all Drupal cache."
drush cc all

LOGIN=`drush uli`
echo "Login link:"
echo "$LOGIN"
echo

echo "[Done Revering All Parts.]"
