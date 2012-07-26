#! /bin/bash

# This MUST be run while the active directory is /sites/default

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

#echo "Saving a db snapshot called site-db-part2a.sql."
echo
#drush sql-dump --skip-tables-key=common > site-db-part2a.sql
echo

echo "Enabling the NISE Net Helper and related modules."
echo
drush en -y nisenet_focused_search nisenet_search
echo
drush en -y nisenet_helper field_convert image_legacy image nisenet_dashboard nisenet_img_styles nisenet_profile2 nisenet_core nisenet_dashboard nisenet_events
echo

echo "Setting the default theme back to NISE Net."
echo
drush vset theme_default "nisenet"
echo

echo "Enabling admin and user inferface modules."
echo
drush en -y admin_menu admin_menu_toolbar admin_views backup_migrate block_class contextual views_ui views_bulk_operations context_ui logintoboggan mollom module_filter
echo

echo "Enabling other contributed modules in two batches."
echo
drush en -y beautytips beautytips_ui ckeditor compact_forms context_menu_block content_dashboard filefield_paths emfield media_vimeo file_force globalredirect lightbox2 print print_mail captcha googleanalytics flowplayer tagadelic
drush en -y results_filter rules rules_admin site_map transliteration views_data_export xmlsitemap xmlsitemap_engines xmlsitemap_menu
echo

echo "Reverting all custom views to what is in nisenet_helper code."
echo "This updates them for d7."
echo
drush vr catalog_featured catalog_most_viewed admin_content_comment admin_content_node admin_content front_catalog front_news mini_grants nodequeue_2 catalog_latest_grid admin_content_taxonomy admin_user_user
echo

echo "Clearing all drupal cache before reverting features."
echo
drush cc all
echo

echo "Reverting all custom features."
echo
drush features-revert -y nisenet_search nisenet_img_styles nisenet_profile2 nisenet_core nisenet_dashboard nisenet_events
echo

echo "Clearing all drupal cache."
echo
drush cc all
echo

echo "Running cron."
echo
drush cron
echo

echo "Enabling Custom (nisenet_migrate) Migrate module for profile conversion."
echo
drush en -y migrate nisenet_migrate
echo

echo "Clearing all drupal cache."
echo
drush cc all
echo

echo "Migrating profiles to profile2 entities."
echo
echo "This can take several (5+) minutes."
echo
drush migrate-import NisenetContentProfile2Profile
echo

echo "Migrate img_assist content filters to inline <img> tags"
echo
php ../all/migrate_scripts/img_assist_convert.php
#drush php-script img_assist_convert --script-path=../all/migrate_scripts
echo

echo "Taking the site back online"
echo
drush vset --always-set site_offline 0
echo

LOGIN=`drush uli`
echo "Login link:"
echo "$LOGIN"
echo

echo "* * * The rest must be done manually. * * *"
echo "* Convert image.module Image nodes at /admin/content/field_convert"
echo "* Visit media update /admin/config/media/rebuild_types"
echo "* You must now manually revert contexts."
echo "/admin/structure/context/list/community/revert"
echo "/admin/structure/context/list/front_page_blocks/revert"
echo "/admin/structure/context/list/vizlab_gallery_page_blocks/revert"
echo


echo
echo "Make sure to disable conversion modules when all done" 
echo "drush dis -y field_convert image_legacy AND ANY OTHERS"
echo



echo "Done with part 2."
echo

