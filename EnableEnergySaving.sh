#!/bin/bash

# Enable screen blanking
gsettings set org.gnome.desktop.session idle-delay 180

# Enable power saving options for display on battery and AC
gsettings set org.gnome.settings-daemon.plugins.power idle-dim true
gsettings set org.gnome.settings-daemon.plugins.power power-saver-profile-on-low-battery true

# Enable power saving options for display on battery and AC
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'suspend'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'suspend'


## closing lid action

# in gsettings
gsettings set org.gnome.settings-daemon.plugins.power lid-close-ac-action 'suspend'
gsettings set org.gnome.settings-daemon.plugins.power lid-close-battery-action 'suspend'


# in login.conf
#Define the file to modify
CONFIG_FILE="/etc/systemd/logind.conf"

# Use sed to uncomment and change the HandleLidSwitch value
sudo sed -i '/^#HandleLidSwitch=/s/^#//; s/HandleLidSwitch=.*/HandleLidSwitch=suspend-then-hibernate/' "$CONFIG_FILE"
