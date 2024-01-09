#!/bin/bash

echo "Are you sure you want to delete all previously installed Apps? [Enter]"
read

# System auf den neuesten Stand bringen
cd
sudo apt update -y && sudo apt upgrade -y

# Remove Software Properties
sudo apt remove -y software-properties-common

# Remove Office365 WebDesktop
sudo snap remove office365webdesktop

# Remove Teams
sudo snap remove teams-for-linux

# Remove OneDrive GUI:
sudo rm OneDriveGUI-1.0.3_fix116-x86_64.AppImage
sudo rm /etc/apt/sources.list.d/onedrive.list
sudo rm /usr/share/keyrings/obs-onedrive.gpg
sudo rm /etc/apt/sources.list.d/obs-onedrive.list
sudo apt remove onedrive
sudo rm -r ~/.config/onedrive
sudo rm -r ~/.config/onedrive-gui

# Remove ownCloud
sudo apt remove owncloud-client
sudo rm /etc/apt/sources.list.d/owncloud.list
sudo rm /etc/apt/trusted.gpg.d/owncloud.gpg
sudo apt remove apt-transport-https

# Remove Notepad++
sudo apt remove -y wine
sudo snap remove notepad-plus-plus

# Remove Zoom
sudo snap remove zoom-client

# Remove Flameshot
sudo apt remove flameshot
sudo rm -r ~/.config/flameshot

# Remove Gnome-Tweaks
sudo apt remove gnome-tweaks

# Remove fSearch
sudo snap remove fsearch

# Remove Intune
sudo apt remove intune-portal
sudo rm /etc/apt/sources.list.d/microsoft-ubuntu-jammy-prod.list
sudo rm /usr/share/keyrings/microsoft.gpg

# Remove Printers
sudo lpadmin -x br-pr-ug
sudo lpadmin -x br-pr-001
sudo lpadmin -x br-pr-004
sudo lpadmin -x br-pr-005

# Remove DisplayLink driver
sudo apt-get remove --purge displaylink-driver

# Remove additional Camera Driver packages
sudo apt-get remove --purge v4l2loopback-dkms
sudo rmmod v4l2loopback

# Add Locks again
sudo touch /var/lib/dpkg/lock-frontend
sudo touch /var/lib/dpkg/lock

# Undo Synaptics repository keyring installation
sudo apt-get remove --purge synaptics-repository-keyring

sudo apt update -y && sudo apt upgrade -y
sudo apt autoremove -y && sudo apt autoclean -y

echo "All dependent Apps are removed."
echo "Press [Enter] to proceed"
read
