#! /bin/bash
cd ~/Sites/nisenet_d6/sites/default
echo
echo "drop database"
drush sql-drop -y
echo
echo "Move modules dir to migrate dir"
#mv ../all/modules ../all/migrate
echo
echo "Move modules dir to not-modules dir"
#mv ../all/not-modules/ ../all/modules

echo "move settings.php"
cp settings-d6.php settings.php
echo

echo "checkout master"
git checkout master
echo "import d6 database"
drush sqlc < ~/Downloads/site-db.sql

TODAY=`date "+%Y%m%d"`-`date +%H%M%S`
echo "Today is $TODAY"
echo

LOGIN=`drush uli -l nisenet`
echo "Login link:"
echo "$LOGIN"
echo

echo "[done]"
