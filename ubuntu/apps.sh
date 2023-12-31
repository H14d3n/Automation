#!/bin/bash

echo "Press [Enter] to Install"
read

cd
# System auf den neuesten Stand bringen
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y software-properties-common

# Office365 WebDesktop
sudo snap install --edge office365webdesktop

# Teams App und Konfiguration
sudo snap install teams-for-linux

# OneDrive GUI
sudo apt remove onedrive
sudo add-apt-repository --remove ppa:yann1ck
sudo rm /etc/systemd/user/default.target.wants/onedrive.service
sudo rm -rf /var/lib/dpkg/lock-frontend
sudo rm -rf /var/lib/dpkg/lock
sudo apt update -y
sudo apt upgrade -y
wget -qO - https://download.opensuse.org/repositories/home:/npreining:/debian-ubuntu-onedrive/xUbuntu_22.04/Release.key | gpg --dearmor | sudo tee /usr/share/keyrings/obs-onedrive.gpg > /dev/null
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/obs-onedrive.gpg] https://download.opensuse.org/repositories/home:/npreining:/debian-ubuntu-onedrive/xUbuntu_22.04/ ./" | sudo tee /etc/apt/sources.list.d/onedrive.list
sudo apt install -y python3
sudo apt install -y fuse
sudo apt install -y --no-install-recommends --no-install-suggests onedrive
wget https://github.com/bpozdena/OneDriveGUI/releases/download/v1.0.3/OneDriveGUI-1.0.3_fix116-x86_64.AppImage
chmod +x OneDriveGUI-1.0.3_fix116-x86_64.AppImage

# ownCloud (SwitchDrive)
wget -nv https://download.owncloud.com/desktop/ownCloud/stable/latest/linux/Ubuntu_22.04/Release.key -O - | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/owncloud.gpg > /dev/null

sudo apt update
sudo apt install -y apt-transport-https

echo 'deb https://download.owncloud.com/desktop/ownCloud/stable/latest/linux/Ubuntu_22.04/ /' | sudo tee -a /etc/apt/sources.list.d/owncloud.list

sudo apt update
sudo apt install -y owncloud-client

# Notepad++
sudo apt install -y wine
sudo snap install --classic notepad-plus-plus

# Zoom
sudo snap install zoom-client

# Flameshot (Ubuntu on Xorg required)
sudo apt install -y flameshot
sudo apt update

# Gnome Tweaks
sudo apt install -y gnome-tweaks

# fSearch
sudo snap install fsearch

# Intune Portal
sudo apt install -y curl gpg

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/ubuntu/22.04/prod jammy main" > /etc/apt/sources.list.d/microsoft-ubuntu-jammy-prod.list'
sudo rm microsoft.gpg

sudo apt update
sudo apt install -y intune-portal

sudo apt update -y && sudo apt upgrade -y
sudo apt install -y gnome-control-center

# Add Printers
sudo lpadmin -p br-pr-ug -E -v socket://10.5.20.25 -L "Campus Brig Drucker UG"
sudo lpadmin -p br-pr-eg -E -v socket://10.5.20.24 -L "Campus Brig Drucker EG"
sudo lpadmin -p br-pr-001 -E -v socket://10.5.20.23 -L "Campus Brig Drucker 1.Stock" -P ~/Automation/ubuntu/printerref/Ricoh-IM_C3000-Postscript-Ricoh.ppd
sudo lpadmin -p br-pr-004 -E -v socket://10.5.20.22 -L "Campus Brig Drucker 4.Stock"
sudo lpadmin -p br-pr-005 -E -v socket://10.5.20.21 -L "Campus Brig Drucker 5.Stock"
sudo lpadmin -p si-pr-001 -E -v socket://10.2.30.36 -L "Standort Siders Drucker"
sudo lpadmin -p pf-pr-001 -E -v socket://10.2.20.36 -L "Standort Pfäffikon Drucker"
sudo lpadmin -p fr-pr-001 -E -v socket://10.2.40.36 -L "Standort Freiburg Drucker"


# Reboot to apply all changes, don't forget to use Xorg
# Automatic reboot without user confirmation
echo "If Errors occur, please run the remove-apps script and reinstall."
echo "Proceed to reboot? [Enter]"
read
reboot
