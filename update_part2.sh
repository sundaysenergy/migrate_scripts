#! /bin/bash

# This MUST be run while the active directory is /sites/default

echo "Enable the nodequeue module."
echo
drush en -y nodequeue
echo

echo "Drupal can now see all the contributed modules"
echo

echo "Run update.php with verbose debug information."
echo
drush updb -y
echo

echo "This would be a good point to take a db snapshot."
echo

echo "Enable the NISE Net Helper module."
echo
drush en -y nisenet_helper nisenet_dashboard nisenet_img_styles nisenet_profile2
echo

echo "Revert some features."
echo
drush features-revert nisenet_profile2 nisenet_img_styles -y
echo

echo "Set the default theme back to NISE Net."
echo
drush vset theme_default "nisenet"
echo

echo "Enable admin and user inferface modules."
echo
drush en -y admin_menu admin_menu_toolbar admin_views backup_migrate block_class contextual views_ui views_bulk_operations context_ui logintoboggan mollom module_filter
echo

echo "Enable other contributed modules"
echo
drush en -y context_menu_block badges content_dashboard filefield_paths emfield media_vimeo file_force globalredirect lightbox2 site_map transliteration print print_mail rules rules_admin captcha googleanalytics flowplayer tagadelic beautytips beautytips_ui ckeditor compact_forms results_filter views_data_export xmlsitemap xmlsitemap_engines xmlsitemap_menu
echo

echo "Take site back online"
echo
drush vset --always-set site_offline 0
echo

echo "Clear all drupal cache."
echo
drush cc all
echo

echo "Revert some views to what is in code. This updates them for d7."
echo
drush vr catalog_featured catalog_most_viewed admin_content_comment admin_content_node admin_content front_catalog front_news mini_grants nodequeue_2 catalog_latest_grid admin_content_taxonomy admin_user_user
echo

echo "Clear all drupal cache."
echo
drush cc all
echo

LOGIN=`drush uli`
echo "Login link:"
echo "$LOGIN"
echo

echo "You must now manually revert contexts."
echo
