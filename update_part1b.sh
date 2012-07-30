#! /bin/bash

echo "Rename sites/all/migrate to sites/all/modules."
echo "sites/all/modules contains a few symbolic links to sites/all/not-modules."
echo "The only modules in sites/all/modules are related to updating content."
mv ../all/migrate ../all/modules
echo

echo "Enable the required content modules located in sites/all/modules."
drush en content_migrate computed_field content_taxonomy content_taxonomy_migrate date email field_group ctools image link references node_reference user_reference -y
echo

echo "Clear all drupal cache."
drush cc all
echo

echo "Migrate content fields from d6 cck to d6 fields."
echo "You could also visit /admin/structure/content_migrate"
drush content-migrate-fields -y
echo

echo "All content fields have been updated."
echo

echo "Move sites/all/modules back to sites/all/migrate."
mv ../all/modules ../all/migrate
echo

echo "Move sites/all/not-modules back to sites/all/modules"
mv ../all/not-modules ../all/modules
echo

echo "[Part 1B Done]"
