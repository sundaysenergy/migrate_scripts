#! /bin/bash

echo "Renaming sites/all/migrate to sites/all/modules."
echo "sites/all/modules contains symbolic links to sites/all/not-modules."
echo "The only modules in the current sites/all/modules are related to updating content fields."
#sudo mv ../all/migrate ../all/modules
mv ../all/migrate ../all/modules
echo

echo "Enable the required content modules located in sites/all/modules + features & admin menu."
echo
drush en -y content_migrate computed_field content_taxonomy content_taxonomy_migrate date email
echo
drush en -y field_group ctools link references node_reference user_reference features admin_menu image
echo

echo "Run database update on the content modules."
drush updb -y
echo

echo "[Part 2 Done]"
echo
