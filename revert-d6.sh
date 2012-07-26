#! /bin/bash

TODAY=`date "+%Y%m%d"`-`date +%H%M%S`
echo "Today is $TODAY if you were wondering..."
echo

echo "Switch to /sites/default directory."
cd ../../default
echo

echo "drop database"
drush sql-drop -y
echo

echo "Move modules dir to migrate dir"
mv ../all/modules ../all/migrate
echo

echo "Move modules dir to not-modules dir"
#sudo mv ../all/not-modules/ ../all/modules
mv ../all/not-modules/ ../all/modules
echo

echo "Copy d6 settings to settings.php"
#sudo cp settings-d6.php settings.php
cp settings-d6.php settings.php
echo

echo "Checkout master."
#sudo su gituser -c "git checkout master"
git checkout master
echo

echo "Import d6 database."
drush sqlc < site-db-d6.sql
echo

LOGIN=`drush uli -l nisenet`
echo "Login link:"
echo "$LOGIN"
echo

echo "[done]"
