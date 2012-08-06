#! /bin/bash

# /mnt/web/development/var/www/html/nisenet/htdocs/migrate/sites/default

TODAY=`date "+%Y%m%d"`-`date +%H%M%S`
echo "Today is $TODAY if you were wondering..."
echo

echo "Switch to /sites/default directory."
cd ../../default
echo

echo "Dropping the database."
drush sql-drop -y
echo

echo "Moving modules dir to not-modules dir"
#sudo mv ../all/not-modules/ ../all/modules
mv ../all/not-modules/ ../all/modules
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

LOGIN=`drush uli -l nisenet`
echo "Login link:"
echo "$LOGIN"
echo

echo "[Done Reverting Part1 A]"
