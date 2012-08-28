#! /bin/bash
echo "Migrate content fields from d6 cck to d6 fields."
echo "You could also visit /admin/structure/content_migrate"
#drush -y content-migrate-fields
echo

echo
drush content-migrate-field-structure field_program_length
drush content-migrate-field-data field_program_length
echo
drush content-migrate-field-structure field_content_evaluated
drush content-migrate-field-data field_content_evaluated
echo
drush content-migrate-field-structure field_content_peer_reviewed
drush content-migrate-field-data field_content_peer_reviewed
echo
drush content-migrate-field-structure field_time_set_up_hours
drush content-migrate-field-data field_time_set_up_hours
echo
drush content-migrate-field-structure field_general_description
drush content-migrate-field-data field_general_description
echo
drush content-migrate-field-structure field_time_set_up_minutes
drush content-migrate-field-data field_time_set_up_minutes
echo
drush content-migrate-field-structure field_big_ideas
drush content-migrate-field-data field_big_ideas
echo
drush content-migrate-field-structure field_script_0
drush content-migrate-field-data field_script_0
echo
drush content-migrate-field-structure field_contact_person
drush content-migrate-field-data field_contact_person
echo
drush content-migrate-field-structure field_credits
drush content-migrate-field-data field_credits
echo
drush content-migrate-field-structure field_terms
drush content-migrate-field-data field_terms
echo
drush content-migrate-field-structure field_materials
drush content-migrate-field-data field_materials
echo
drush content-migrate-field-structure field_program_accessibility
drush content-migrate-field-data field_program_accessibility
echo
drush content-migrate-field-structure field_time_program_hours
drush content-migrate-field-data field_time_program_hours
echo
drush content-migrate-field-structure field_background_information_pr
drush content-migrate-field-data field_background_information_pr
echo
drush content-migrate-field-structure field_time_program_minutes
drush content-migrate-field-data field_time_program_minutes
echo
drush content-migrate-field-structure field_program_accessibility_tip
drush content-migrate-field-data field_program_accessibility_tip
echo
drush content-migrate-field-structure field_safety
drush content-migrate-field-data field_safety
echo
drush content-migrate-field-structure field_procedure
drush content-migrate-field-data field_procedure
echo
drush content-migrate-field-structure field_tips
drush content-migrate-field-data field_tips
echo
drush content-migrate-field-structure field_common_questions
drush content-migrate-field-data field_common_questions
echo
drush content-migrate-field-structure field_going_further
drush content-migrate-field-data field_going_further
echo
drush content-migrate-field-structure field_time_clean_up_hours
drush content-migrate-field-data field_time_clean_up_hours
echo
drush content-migrate-field-structure field_cleanup
drush content-migrate-field-data field_cleanup
echo
drush content-migrate-field-structure field_content_vetted_scientists
drush content-migrate-field-data field_content_vetted_scientists
echo
drush content-migrate-field-structure field_learning_goals_list
drush content-migrate-field-data field_learning_goals_list
echo
drush content-migrate-field-structure field_page_title
drush content-migrate-field-data field_page_title
echo
drush content-migrate-field-structure field_information_reference
drush content-migrate-field-data field_information_reference
echo
drush content-migrate-field-structure field_resources
drush content-migrate-field-data field_resources
echo
drush content-migrate-field-structure field_sectionprogram_adaptable
drush content-migrate-field-data field_sectionprogram_adaptable
echo
drush content-migrate-field-structure field_reference_evaluation
drush content-migrate-field-data field_reference_evaluation
echo
drush content-migrate-field-structure field_representational_image
drush content-migrate-field-data field_representational_image
echo
drush content-migrate-field-structure field_permissions_nise
drush content-migrate-field-data field_permissions_nise
echo
drush content-migrate-field-structure field_permissions_nise_attribute
drush content-migrate-field-data field_permissions_nise_attribute
echo
drush content-migrate-field-structure field_authors_multiple
drush content-migrate-field-data field_authors_multiple
echo
drush content-migrate-field-structure field_organization
drush content-migrate-field-data field_organization
echo
drush content-migrate-field-structure field_author_other
drush content-migrate-field-data field_author_other
echo
drush content-migrate-field-structure field_organization_other
drush content-migrate-field-data field_organization_other
echo
drush content-migrate-field-structure field_product_content_map
drush content-migrate-field-data field_product_content_map
echo
drush content-migrate-field-structure field_resourcefiles
drush content-migrate-field-data field_resourcefiles
echo
drush content-migrate-field-structure field_spanishfiles
drush content-migrate-field-data field_spanishfiles
echo
drush content-migrate-field-structure field_creditinfo
drush content-migrate-field-data field_creditinfo
echo
drush content-migrate-field-structure field_funding
drush content-migrate-field-data field_funding
echo
drush content-migrate-field-structure field_nanodays
drush content-migrate-field-data field_nanodays
echo
drush content-migrate-field-structure field_k12
drush content-migrate-field-data field_k12
echo
drush content-migrate-field-structure field_eval_toggle
drush content-migrate-field-data field_eval_toggle
echo
drush content-migrate-field-structure field_comment_toggle
drush content-migrate-field-data field_comment_toggle
echo
drush content-migrate-field-structure field_section
drush content-migrate-field-data field_section
echo
drush content-migrate-field-structure field_sectionprogram
drush content-migrate-field-data field_sectionprogram
echo
drush content-migrate-field-structure field_sectionexhibit
drush content-migrate-field-data field_sectionexhibit
echo
drush content-migrate-field-structure field_sectiontoolguide
drush content-migrate-field-data field_sectiontoolguide
echo
drush content-migrate-field-structure field_sectionmedia
drush content-migrate-field-data field_sectionmedia
echo
drush content-migrate-field-structure field_topics
drush content-migrate-field-data field_topics
echo
drush content-migrate-field-structure field_ages
drush content-migrate-field-data field_ages
echo
drush content-migrate-field-structure field_freetags
drush content-migrate-field-data field_freetags
echo
drush content-migrate-field-structure field_inquiry
drush content-migrate-field-data field_inquiry
echo
drush content-migrate-field-structure field_physicalsci
drush content-migrate-field-data field_physicalsci
echo
drush content-migrate-field-structure field_lifesci
drush content-migrate-field-data field_lifesci
echo
drush content-migrate-field-structure field_earthspace
drush content-migrate-field-data field_earthspace
echo
drush content-migrate-field-structure field_personalsocial
drush content-migrate-field-data field_personalsocial
echo
drush content-migrate-field-structure field_scitech
drush content-migrate-field-data field_scitech
echo
drush content-migrate-field-structure field_historynature
drush content-migrate-field-data field_historynature
echo
drush content-migrate-field-structure field_translations
drush content-migrate-field-data field_translations
echo
drush content-migrate-field-structure field_resourcelinks
drush content-migrate-field-data field_resourcelinks
echo
drush content-migrate-field-structure field_eventloc
drush content-migrate-field-data field_eventloc
echo
drush content-migrate-field-structure field_eventdate
drush content-migrate-field-data field_eventdate
echo
drush content-migrate-field-structure field_eventimg
drush content-migrate-field-data field_eventimg
echo
drush content-migrate-field-structure field_eventfeat
drush content-migrate-field-data field_eventfeat
echo
drush content-migrate-field-structure field_subtitle
drush content-migrate-field-data field_subtitle
echo
drush content-migrate-field-structure field_license
drush content-migrate-field-data field_license
echo
drush content-migrate-field-structure field_image_author
drush content-migrate-field-data field_image_author
echo
drush content-migrate-field-structure field_title
drush content-migrate-field-data field_title
echo
drush content-migrate-field-structure field_first_name
drush content-migrate-field-data field_first_name
echo
drush content-migrate-field-structure field_work_url
drush content-migrate-field-data field_work_url
echo
drush content-migrate-field-structure field_last_name
drush content-migrate-field-data field_last_name
echo
drush content-migrate-field-structure field_middle_name
drush content-migrate-field-data field_middle_name
echo
drush content-migrate-field-structure field_work_phone
drush content-migrate-field-data field_work_phone
echo
drush content-migrate-field-structure field_personal_url
drush content-migrate-field-data field_personal_url
echo
drush content-migrate-field-structure field_suffix
drush content-migrate-field-data field_suffix
echo
drush content-migrate-field-structure field_fax
drush content-migrate-field-data field_fax
echo
drush content-migrate-field-structure field_honorific
drush content-migrate-field-data field_honorific
echo
drush content-migrate-field-structure field_gender
drush content-migrate-field-data field_gender
echo
drush content-migrate-field-structure field_primary_nano_interests
drush content-migrate-field-data field_primary_nano_interests
echo
drush content-migrate-field-structure field_department
drush content-migrate-field-data field_department
echo
drush content-migrate-field-structure field_facebook
drush content-migrate-field-data field_facebook
echo
drush content-migrate-field-structure field_twitter
drush content-migrate-field-data field_twitter
echo
drush content-migrate-field-structure field_linkedin
drush content-migrate-field-data field_linkedin
echo
drush content-migrate-field-structure field_profile_active_user
drush content-migrate-field-data field_profile_active_user
echo
drush content-migrate-field-structure field_profile_show_in_directory
drush content-migrate-field-data field_profile_show_in_directory
echo
drush content-migrate-field-structure field_country
drush content-migrate-field-data field_country
echo
drush content-migrate-field-structure field_hub
drush content-migrate-field-data field_hub
echo
drush content-migrate-field-structure field_stateprov
drush content-migrate-field-data field_stateprov
echo
drush content-migrate-field-structure field_prof_cat
drush content-migrate-field-data field_prof_cat
echo
drush content-migrate-field-structure field_mg_int_nano
drush content-migrate-field-data field_mg_int_nano
echo
drush content-migrate-field-structure field_mg_project_yr
drush content-migrate-field-data field_mg_project_yr
echo
drush content-migrate-field-structure field_mg_desc_long
drush content-migrate-field-data field_mg_desc_long
echo
drush content-migrate-field-structure field_mg_desc_short
drush content-migrate-field-data field_mg_desc_short
echo
drush content-migrate-field-structure field_mg_contact
drush content-migrate-field-data field_mg_contact
echo
drush content-migrate-field-structure field_mg_contact_email
drush content-migrate-field-data field_mg_contact_email
echo
drush content-migrate-field-structure field_mg_state
drush content-migrate-field-data field_mg_state
echo
drush content-migrate-field-structure field_mg_region
drush content-migrate-field-data field_mg_region
echo
drush content-migrate-field-structure field_mg_city
drush content-migrate-field-data field_mg_city
echo
drush content-migrate-field-structure field_mg_underserved
drush content-migrate-field-data field_mg_underserved
echo
drush content-migrate-field-structure field_mg_partnerships
drush content-migrate-field-data field_mg_partnerships
echo
drush content-migrate-field-structure field_institution_phone
drush content-migrate-field-data field_institution_phone
echo
drush content-migrate-field-structure field_type
drush content-migrate-field-data field_type
echo
drush content-migrate-field-structure field_institution_fax
drush content-migrate-field-data field_institution_fax
echo
drush content-migrate-field-structure field_organization_url
drush content-migrate-field-data field_organization_url
echo
drush content-migrate-field-structure field_org_logo
drush content-migrate-field-data field_org_logo
echo
drush content-migrate-field-structure field_public_description
drush content-migrate-field-data field_public_description
echo
drush content-migrate-field-structure field_public_link
drush content-migrate-field-data field_public_link
echo
drush content-migrate-field-structure field_public_image
drush content-migrate-field-data field_public_image
echo
drush content-migrate-field-structure field_hub_description
drush content-migrate-field-data field_hub_description
echo
drush content-migrate-field-structure field_region
drush content-migrate-field-data field_region
echo
drush content-migrate-field-structure field_contact
drush content-migrate-field-data field_contact
echo
drush content-migrate-field-structure field_member_organization
drush content-migrate-field-data field_member_organization
echo
drush content-migrate-field-structure field_email
drush content-migrate-field-data field_email
echo
drush content-migrate-field-structure field_phone
drush content-migrate-field-data field_phone
echo
drush content-migrate-field-structure field_major_findings
drush content-migrate-field-data field_major_findings
echo
drush content-migrate-field-structure field_evaldate
drush content-migrate-field-data field_evaldate
echo
drush content-migrate-field-structure field_evalauthors
drush content-migrate-field-data field_evalauthors
echo
drush content-migrate-field-structure field_evalmeth
drush content-migrate-field-data field_evalmeth
echo
drush content-migrate-field-structure field_prodstud
drush content-migrate-field-data field_prodstud
echo
drush content-migrate-field-structure field_evalcat
drush content-migrate-field-data field_evalcat
echo
drush content-migrate-field-structure field_evaldox
drush content-migrate-field-data field_evaldox
echo
drush content-migrate-field-structure field_asscprod
drush content-migrate-field-data field_asscprod
echo
drush content-migrate-field-structure field_science_image_featured
drush content-migrate-field-data field_science_image_featured
echo
drush content-migrate-field-structure field_resource_image
drush content-migrate-field-data field_resource_image
echo
drush content-migrate-field-structure field_dimensions_size
drush content-migrate-field-data field_dimensions_size
echo
drush content-migrate-field-structure field_pixel_width
drush content-migrate-field-data field_pixel_width
echo
drush content-migrate-field-structure field_pixel_height
drush content-migrate-field-data field_pixel_height
echo
drush content-migrate-field-structure field_recipe
drush content-migrate-field-data field_recipe
echo
drush content-migrate-field-structure field_cocktail_image
drush content-migrate-field-data field_cocktail_image
echo
drush content-migrate-field-structure field_note
drush content-migrate-field-data field_note
echo

echo "Done migrating fields."
echo
echo "All content fields have been updated."
echo
echo "[Part 3 Done]"
echo
