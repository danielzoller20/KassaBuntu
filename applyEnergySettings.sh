#!/bin/bash

## Energy settings to prevent disablig of screen

# Disable screen blanking
gsettings set org.gnome.desktop.session idle-delay 0

# Disable automatic screen lock
gsettings set org.gnome.desktop.screensaver lock-enabled false

# Disable power saving options for display on battery and AC
gsettings set org.gnome.settings-daemon.plugins.power idle-dim false


## ignore closing lid

# Define the file to modify
CONFIG_FILE="/etc/systemd/logind.conf"

# Use sed to uncomment and change the HandleLidSwitch value
sudo sed -i '/^#HandleLidSwitch=/s/^#//; s/HandleLidSwitch=.*/HandleLidSwitch=ignore/' "$CONFIG_FILE"