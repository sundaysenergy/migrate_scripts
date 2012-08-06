#! /bin/bash

echo "Renaming sites/all/migrate to sites/all/modules."
echo "sites/all/modules contains symbolic links to sites/all/not-modules."
echo "The only modules in the current sites/all/modules are related to updating content fields."
#sudo mv ../all/migrate ../all/modules
mv ../all/migrate ../all/modules
echo

echo "Enable the required content modules located in sites/all/modules."
drush en -y content_migrate computed_field content_taxonomy content_taxonomy_migrate date email field_group ctools image link references node_reference user_reference
echo

echo "Migrate content fields from d6 cck to d6 fields."
echo "You could also visit /admin/structure/content_migrate"
#drush -y content-migrate-fields
../all/migrate_scripts/update_part1b_fields.sh
echo

echo "All content fields have been updated."
echo

echo "Moving sites/all/modules back to sites/all/migrate."
# sudo ../all/modules ../all/migrate
mv ../all/modules ../all/migrate
echo

echo "Moving sites/all/not-modules back to sites/all/modules"
# sudo mv ../all/not-modules ../all/modules
mv ../all/not-modules ../all/modules
echo

echo "Clearing all drupal cache."
drush cc all
echo

echo "[Part 1B Done]"
