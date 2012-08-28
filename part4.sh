#! /bin/bash

echo "Moving sites/all/modules back to sites/all/migrate."
# sudo ../all/modules ../all/migrate
mv ../all/modules ../all/migrate
echo

echo "Moving sites/all/not-modules back to sites/all/modules"
# sudo mv ../all/not-modules ../all/modules
mv ../all/not-modules ../all/modules
echo

echo "Clearing all drupal cache."
echo
drush cc all
echo

echo "[Part 4 Done]"
echo
