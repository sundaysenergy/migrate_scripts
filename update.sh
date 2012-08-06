#! /bin/bash

# Prep work

TODAY=`date "+%Y%m%d"`-`date +%H%M%S`
echo "FYI Today is $TODAY"
echo

echo "Saving a db snapshot called site-db-d6.sql."
drush sql-dump --skip-tables-key=common > site-db-d6.sql
echo

echo "Change into sites/default directory."
cd ../../default
echo

echo "* * * * Beginning Part 1A. * * * *"
echo

echo "Running update_part1a.sh"
../all/migrate_scripts/update_part1a.sh
echo

echo "Saving a db snapshot called site-db-part1a.sql."
drush sql-dump --skip-tables-key=common > site-db-part1a.sql
echo

echo "* * * * Beginning Part 1B. * * * *"
echo

echo "Running update_part1b.sh"
../all/migrate_scripts/update_part1b.sh
echo

echo "Saving a db snapshot called site-db-part1b.sql."
drush sql-dump --skip-tables-key=common > site-db-part1b.sql
echo

echo "* * * * Beginning Part 1B. * * * *"
echo

echo "Running update_part2a.sh"
../all/migrate_scripts/update_part2a.sh
echo

echo "Saving a db snapshot called site-db-part2a.sql."
echo
drush sql-dump --skip-tables-key=common > site-db-part2a.sql
echo

echo "[ALL DONE!]"
