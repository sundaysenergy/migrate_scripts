#! /bin/bash

echo "This MUST be run while the active directory is /sites/default"
echo

echo "Enabling image related modules for image node migration."
echo
drush en -y field_convert nisenet_img_styles image image_legacy
echo

echo "Enabling the NISE Net Helper and related modules."
echo
drush en -y nisenet_focused_search nisenet_search nisenet_helper
echo

echo
drush en -y nisenet_img_styles nisenet_core nisenet_dashboard nisenet_events nisenet_minor_content_types nisenet_profile2
echo

echo "Setting the default theme back to NISE Net."
echo
drush vset theme_default "nisenet"
echo

echo "Contexts"
echo
drush ctools-export-revert context community front_page_blocks vizlab_gallery_page_blocks
echo

echo "Enabling admin and user inferface modules."
echo
drush en -y admin_menu_toolbar admin_views backup_migrate block_class contextual views_ui views_bulk_operations context_ui context_respect logintoboggan mollom module_filter
echo

echo "Enabling other contributed modules in three batches."
echo
drush en -y beautytips beautytips_ui ckeditor captcha googleanalytics flowplayer compact_forms context_menu_block content_dashboard emfield
echo
drush en -y filefield_paths media_vimeo file_force globalredirect lightbox2 pathauto print print_mail
echo
drush en -y tagadelic results_filter rules rules_admin site_map transliteration views_data_export webform xmlsitemap xmlsitemap_engines xmlsitemap_menu
echo

echo "Reverting all custom views to what is in nisenet_helper code."
echo "This updates them for d7."
echo
drush vr admin_content_taxonomy admin_user_user admin_content_comment admin_content_node admin_content \
blog_network_news_all catalog_featured catalog_most_viewed catalog_latest_grid events catalog_table_o_contents \
front_catalog front_news mini_grants nodequeue_2 viz_lab_image_collection_page
echo

echo "Clearing all drupal cache before reverting features."
echo
drush cc all
echo

echo "Reverting all custom features."
echo
drush features-revert -y nisenet_search nisenet_img_styles nisenet_profile2 nisenet_core nisenet_dashboard nisenet_events nisenet_minor_content_types
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
#Produces error: Migration failed with source plugin exception: SQLSTATE[42S02]: Base table or view not found: 1146 Table 'nisenetconvert.migrate_map_nisenetcontentprofile2profile' doesn't exist


echo "Convert node ref to user ref on region nodes"
echo
drush nnm-field-contact
echo

echo "Taking the site back online"
echo
drush vset --always-set site_offline 0
echo

drush cron
echo

echo "* * * The rest must be done manually. The next steps are: * * *"
echo "* Run image update /admin/content/field_convert"
echo "* Visit media update /admin/config/media/rebuild_types"
echo "/admin/structure/menu/item/75/delete"
echo "Migrate img_assist content filters to inline <img> tags: drush php-script ../all/migrate_scripts/img_assist_convert.php"
echo "Revert the image feature: drush features-revert -y nisenet_image"

echo "Make sure to disable conversion modules when all done"
echo "drush dis -y content_taxonomy_migrate field_convert image_legacy migrate content_dashboard AND ANY OTHERS"
echo "Also - check the additional manual steps at https://gortonstudios.unfuddle.com/a#/projects/112467/notebooks/53120/pages/191892/latest"
echo

echo "Done with part 2."
echo

drush cron
drush cc all

LOGIN=`drush uli`
echo "Login link:"
echo "$LOGIN"
echo
