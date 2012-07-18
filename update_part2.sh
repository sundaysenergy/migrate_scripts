#! /bin/bash

echo "Enable the nodequeue module."
drush en -y nodequeue
echo

echo "Drupal can now see all the contributed modules"
echo

echo "Run update.php with verbose debug information."
drush updb -y
echo

echo "This would be a good point to take a db snapshot."
echo

echo "Enable the NISE Net Helper module."
drush en -y nisenet_helper nisenet_dashboard
echo

echo "Set the default theme back to NISE Net."
drush vset theme_default "nisenet"
echo

echo "Enable admin and user inferface modules."
drush en -y admin_menu admin_menu_toolbar admin_views backup_migrate block_class contextual views_ui views_bulk_operations context_ui logintoboggan mollom module_filter
echo

echo "Enable other contributed modules"
drush en -y context_menu_block badges content_dashboard filefield_paths emfield media_vimeo file_force globalredirect lightbox2 site_map transliteration print print_mail rules rules_admin captcha googleanalytics flowplayer tagadelic beautytips beautytips_ui ckeditor compact_forms results_filter views_data_export xmlsitemap xmlsitemap_engines xmlsitemap_menu
echo

echo "Take site back online"
drush vset --always-set site_offline 0
echo

echo "Clear all drupal cache."
drush cc all
echo

echo "Revert some views to what is in code. This updates them for d7."
drush vr catalog_featured catalog_most_viewed admin_content_comment admin_content_node admin_content front_catalog front_news mini_grants nodequeue_2 catalog_latest_grid admin_content_taxonomy admin_user_user
echo

LOGIN=`drush uli -l nisenet`
echo "Login link:"
echo "$LOGIN"
echo

echo "After update manually revert contexts."
echo
