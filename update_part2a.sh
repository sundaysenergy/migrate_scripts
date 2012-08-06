#! /bin/bash

echo "This MUST be run while the active directory is /sites/default"
echo

echo "Drupal can now see all the contributed modules."
echo

echo "Enabling the nodequeue module first."
echo
drush en -y nodequeue
echo

echo "Running update.php for all non-core modules."
echo
drush updb -y
echo

echo "Enabling image related modules for image node migration."
drush en -y field_convert image_legacy image

echo "Done with part 2 A."
echo
