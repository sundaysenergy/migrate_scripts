#! /bin/bash

TODAY=`date "+%Y%m%d"`-`date +%H%M%S`
echo "FYI Today is $TODAY"
echo

echo "Change into sites/default directory."
cd ../../default
echo

echo "Create enabled.txt file with enabled modules."
drush pml --no-core --type=module --status=enabled --pipe > enabled.txt
echo

echo "Put site into maintenance mode."
drush vset --always-set site_offline 1
echo

echo "Disable all the enabled modules."
xargs drush -y dis < enabled.txt
echo

echo "Disable the PHP input format module."
drush dis php -y
echo

echo "Set the default theme to garland."
drush vset theme_default garland
echo

echo "Switch to the drupal7 branch."
git checkout drupal7
echo

echo "Use sites/default/settings-d7.php for d7 settings.php."
cp settings-d7.php settings.php
echo

echo "Rename sites/all/modules dir to sites/all/not-modules."
mv ../all/modules/ ../all/not-modules
echo

echo "No contributed modules are accessible by drupal at this point."
echo

echo "Run update.php with verbose debug information printed."
drush updb -dvy
echo

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

echo "Move sites/all/not-modules back to sites/all/modules"
mv not-modules modules

echo "Enable the nodequeue module."
drush en -y nodequeue
echo

echo "Drupal can now see all the contributed modules"
echo

echo "Run update.php with verbose debug information."
drush updb -dvy
echo

echo "Enable the NISE Net Helper module."
drush en -y nisenet_helper
echo

echo "Set the default theme back to NISE Net."
drush vset theme_default "nisenet"
echo

echo "Revert some views to what is in code. This updates them for d7."
drush vr catalog_most_viewed front_news catalog_featured mini_grants nodequeue_2 catalog_latest_grid front_catalog
echo

echo "Enable admin and user inferface modules."
drush en -y admin_menu admin_menu_toolbar admin_views backup_migrate block_class contextual views_ui views_bulk_operations context_ui logintoboggan mollom module_filter
echo

echo "Enable other contributed modules"
drush en -y context_menu_block badges content_dashboard filefield_paths emfield media_vimeo file_force globalredirect lightbox2 site_map transliteration print print_mail rules rules_admin captcha googleanalytics flowplayer tagadelic beautytips beautytips_ui ckeditor compact_forms results_filter views_data_export xmlsitemap xmlsitemap_engines xmlsitemap_menu
echo

LOGIN=`drush uli -l nisenet`
echo "Login link:"
echo "$LOGIN"
echo

echo "Take site back online"
drush vset --always-set site_offline 0
echo

echo "[all done]"
