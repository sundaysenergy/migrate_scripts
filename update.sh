#! /bin/bash

# Prep work

TODAY=`date "+%Y%m%d"`-`date +%H%M%S`
echo "FYI Today is $TODAY"
echo

#echo "Saving a db snapshot called site-db-d6.sql."
#drush sql-dump --skip-tables-key=common > site-db-d6.sql
echo

echo "Change into sites/default directory."
cd ../../default
echo

echo "Beginning Part 1A."
echo

echo "Run update_part1a.sh"
../all/migrate_scripts/update_part1a.sh
echo


#echo "Saving a db snapshot called site-db-part1a.sql."
#drush sql-dump --skip-tables-key=common > site-db-part1a.sql
echo

echo "Beginning Part 1B."
echo

echo "Run update_part1b.sh"
../all/migrate_scripts/update_part1b.sh
echo

echo "Run update_part2.sh"
../all/migrate_scripts/update_part2.sh
echo

echo "[all done]"
