#! /bin/bash

echo "This MUST be run while the active directory is /sites/default"
echo

echo "Enabling image related modules for image node migration."
echo
drush en -y field_convert nisenet_img_styles image_legacy
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
drush ctools-export-revert context community front_page_blocks
echo

echo "Enabling admin and user inferface modules."
echo
drush en -y admin_menu_toolbar admin_views backup_migrate block_class contextual
echo
drush en -y views_ui views_bulk_operations context_ui context_respect logintoboggan mollom module_filter
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
front_catalog front_news mini_grants nodequeue_2 viz_lab_image_collection_page admin_content_comment nanodays_products \
Organizations blog_dc_nanowire_taxonomy blog_dc_nanowire_edit admin_user_user catalog_updater admin_content_node admin_content_taxonomy
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


echo "Convert node ref to user ref on region nodes"
echo
drush nnm-field-contact
echo

echo "Fix problem with partially unsaved text list field data (?!?)"
echo
#drush nnm-field-option-list
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
echo "Migrate img_assist content filters to inline <img> tags: drush php-script ../all/migrate_scripts/img_assist_convert.php"
echo "Turn on and revert the NISE Network Images feature at admin/structure/features"
echo "Delete the existing dashboard alias at /admin/config/search/path/delete/27231?destination=admin/config/search/path/list/dashboard"
echo "Delete the bad Catalog link at /admin/structure/menu/item/75/edit"
echo "Create a dashboard page and add menu link. URL alias = dashboard, Menu link in Navigation of 'My Dashboard'"
echo "Update the block titles on the dashboard - remove the word 'dashboard' - e.g. admin/structure/block/manage/menu/menu-dashboard-homepage/configure"
echo "Change title of 'Navigation' block: admin/structure/block/manage/system/navigation/configure -- set to [current-user:name]"
echo "Delete all non-code Contexts at admin/structure/context - everything with a Delete link is safe to delete (even vizlab_gallery_page_blocks)"
echo "Edit the Footer menu block - change the title to \"Sections\" admin/structure/block/manage/menu_block/nisenet-sections-nav/configure"
echo "Remove 'hide on these pages' from the 'Support' menu block: admin/structure/block/manage/menu/menu-support/configure and change the title to 'Support'"
echo "Double-check comments and make sure things like image, book, etc, have comments disabled admin/structure/types"
echo "Add lisence for CKEditor - admin/config/content/ckeditor - or - replace with open source version?"
echo "Delete blog_network_news_taxonomy view (now in code with different name) admin/structure/views/view/blog_network_news_taxonomy/delete"
echo "Verify menu settings on content types - most should be allowed in Main Menu - NOT the default of Navigation (e.g. go down to the 'menu' section on admin/structure/types/manage/page and check the right boxes)"
echo "Make sure to disable conversion modules when all done"
echo "drush dis -y content_taxonomy_migrate field_convert image_legacy migrate content_dashboard AND ANY OTHERS"
echo "Turn on performance settings at admin/config/development/performance"

echo "[Done with part 6.]"
echo

drush cron
drush cc all

LOGIN=`drush uli`
echo "Login link:"
echo "$LOGIN"
echo
