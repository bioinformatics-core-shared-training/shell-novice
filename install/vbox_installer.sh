#!/usr/bin/env bash
# lubuntu LTS 14.04 VirtualBox installer based on lubuntu-14.04.2-desktop-i386
# computer name: crukci-training-vm; user: training; password: admin123

# login as training -----------------------------------------------------------

# install updates

sudo su -
apt-get update
apt-get install -y git nano vim emacs wget ftp man
apt-get install make gcc # for VirtualBox Additions

# Install VirtualBox Additions
# From the VirtualBox menu of lubuntu go to Devices > Insert Guest Additions CD image... and do
cd /media/training/VBOXADDITIONS_4.3.26_98988
sudo ./VBoxLinuxAdditions.run

# Guest Additions need a reboot of your guest OS to take effect
# Then VM menu Devices > Shared clipboard > Bidirectional

# To increase screen resolution
# Start > Preferences > Additional Drivers: Using x86 virtualization solution... and click Apply Changes
# Then Start > Preferences > Monitor Settings and select 1440x1050 and click Save and Apply

# Install course materials
useradd nelle -d /users/nelle -p elephant

mkdir -p /users/nelle

mkdir -p /data/backup
touch /data/access.log
touch /data/hardware.cfg
touch /data/network.cfg

git clone https://github.com/bioinformatics-core-shared-training/shell-novice.git
scp -r shell-novice/filesystem/nelle /users/

chown -R nelle:nelle /users/nelle
chmod -R 711 /users/nelle

# Change password for nelle account Start > System Tools > Users and Groups
# and set shell in advance settings tab Advanced to bash

apt-get autoremove
apt-get clean
exit

# login as nelle / Shell Training ---------------------------------------------
rm -rf Documents/ Downloads/ Music/ Pictures/ Templates/ Videos/

# Add extra keyboard layouts
# Add Firefox and Terminal on Desktop
# Add bookmark to course materials and slides in Firefox
# Remove link to deleted folders like Downloads, etc...
# Change download directory in Firefox
xdg-user-dires-update

### After testing course materials, re-set course structure using this command:
sudo su -
cd shell-novice
git pull
rsync -avr --delete --exclude '.*' --exclude 'Desktop' filesystem/nelle /users/
chown -R nelle:nelle /users/nelle
chmod -R 711 /users/nelle