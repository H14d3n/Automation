#/!/bin/bash

# System auf den neuesten Stand bringen

	sudo apt update -y && sudo apt upgrade -y && sudo apt autoclean -y && sudo apt autoremove -y
	sudo apt install snapd

# Office365 WebDesktop

	sudo snap install --beta Office365webdesktop

# Teams App und Konfiguration
	
	sudo snap install teams-for-linux
	
	sudo apt install v4l2loopback-dkms
	sudo modprobe v4l2loopback

	ffmpeg -f v4l2 -i /dev/video0 -vf format=yuv420p,scale=1280x720 -f v4l2 /dev/video1
	
# OneDrive GUI

    sudo apt remove onedrive

    sudo add-apt repository --remove ppa:yann1ck

    sudo rm /etc/systemd/user/default.target.wants/onedrive.service

    sudo rm -rf /var/lib/dpkg/lock-frontend

    sudo rm -rf /var/lib/dpkg/lock

    sudo apt-get update

    sudo apt-get upgrade -y

    wget -qO - https://download.opensuse.org/repositories/home:/npreining:/debian-ubuntu-onedrive/xUbuntu_22.04/Release.key | gpg --dearmor | sudo tee /usr/share/keyrings/obs-onedrive.gpg > /dev/null

    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/obs-onedrive.gpg] https://download.opensuse.org/repositories/home:/npreining:/debian-ubuntu-onedrive/xUbuntu_22.04/ ./" | sudo tee /etc/apt/sources.list.d/onedrive.list

    sudo apt-get install python3

    sudo apt-get install fuse

    sudo apt-get update

    sudo apt install onedrive

    cd ~/

    wget https://github.com/bpozdena/OneDriveGUI/releases/download/v1.0.3/OneDriveGUI-1.0.3_fix116-x86_64.AppImage .

    chmod +x OneDriveGUI-1.0.3_fix116-x86_64.AppImage
    
    # OneDrive GUI will be stored in the Home-Folder, where you can access and use it. 
	
# ownCloud (SwitchDrive) 

	wget -nv https://download.owncloud.com/desktop/ownCloud/stable/latest/linux/Ubuntu_22.04/Release.key -O - | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/owncloud.gpg > /dev/null

	sudo apt update

	sudo apt install apt-transport-https

	echo 'deb https://download.owncloud.com/desktop/ownCloud/stable/latest/linux/Ubuntu_22.04/ /' | sudo tee -a /etc/apt/sources.list.d/owncloud.list

	sudo apt update

	sudo apt install owncloud-client
	
	
# Notepad++
	
	sudo snap install notepad-plus-plus
	
# Zoom
	
	sudo snap install zoom-client
	
# Flameshot (Ubuntu on Xorg required)

	sudo apt install flameshot
 	sudo apt update
	
# Gnome Tweaks
	
	sudo apt install gnome-tweaks

# fSearch

	sudo snap install fsearch

# Intune Portal
	
	sudo apt install curl gpg
	
	curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
	sudo install -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/ 
	sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/ubuntu/22.04/prod jammy main" > /etc/apt/sources.list.d/microsoft-ubuntu-jammy-prod.list' 
	sudo rm microsoft.gpg
	
	sudo apt update
	sudo apt install intune-portal

	
# Synaptics DisplayLink
	
	wget install "https://www.synaptics.com/sites/default/files/Ubuntu/pool/stable/main/all/synaptics-repository-keyring.deb"
	
	sudo apt update -y && sudo apt upgrade -y
	
	sudo apt install displaylink-driver
	
# Wine

	sudo apt install wine
	
	
	sudo apt update -y && sudo apt upgrade -y && sudo apt autoclean && sudo apt autoremove
	
reboot




