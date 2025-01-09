#!/bin/bash

## Energy settings to prevent disablig of screen

# Disable screen blanking
gsettings set org.gnome.desktop.session idle-delay 0

# Disable automatic screen lock
gsettings set org.gnome.desktop.screensaver lock-enabled false

# Disable power saving options for display on battery and AC
gsettings set org.gnome.settings-daemon.plugins.power idle-dim false
gsettings set org.gnome.settings-daemon.plugins.power power-saver-profile-on-low-battery false

# Disalbe sleep after inactivity
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'


## ignore closing lid

# in gsettings
gsettings set org.gnome.settings-daemon.plugins.power lid-close-ac-action 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power lid-close-battery-action 'nothing'

# Define the file to modify
CONFIG_FILE="/etc/systemd/logind.conf"

# Use sed to uncomment and change the HandleLidSwitch value
sudo sed -i '/^#HandleLidSwitch=/s/^#//; s/HandleLidSwitch=.*/HandleLidSwitch=ignore/' "$CONFIG_FILE"