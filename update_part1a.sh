#! /bin/bash

echo "Begin Part 1A - Update core database tables."
echo

echo "Put site into maintenance mode."
drush vset --always-set site_offline 1
echo

echo "Disabling Vertical Response and the PHP input format module."
drush -y dis cookie_cache_bypass php vr
echo

echo "Creating enabled.txt file with enabled modules."
drush pml --no-core --type=module --status=enabled --pipe > enabled.txt
echo

echo "Disabling all the enabled modules."
xargs drush -y dis < enabled.txt
echo

echo "Set the default theme to garland."
drush vset theme_default garland
echo

echo "Switch to the drupal7 branch."
#sudo su gituser -c "git checkout drupal7"
git checkout drupal7
echo

echo "Use sites/default/settings-d7.php for d7 settings.php."
# sudo cp settings-d7.php settings.php
cp settings-d7.php settings.php
echo

echo "Renaming sites/all/modules dir to sites/all/not-modules."
# sudo mv ../all/modules/ ../all/not-modules
mv ../all/modules/ ../all/not-modules
echo

echo "No contributed modules are accessible by drupal at this point."
echo

echo "This next command will conclude Part 1A."
echo

echo "Running update.php with verbose debug information printed."
drush updb -vy
echo

echo "Core database tables have been migrated."
echo "[Part 1A Done]"
echo
