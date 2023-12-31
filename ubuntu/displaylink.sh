#!/bin/bash

# Download and install Synaptics repository keyring
wget https://www.synaptics.com/sites/default/files/Ubuntu/pool/stable/main/all/synaptics-repository-keyring.deb
sudo dpkg -i synaptics-repository-keyring.deb
sudo apt-get update

# Upgrade packages
sudo apt-get upgrade -y

# Install DisplayLink driver
sudo apt-get install -y displaylink-driver

# Clean up
rm synaptics-repository-keyring.deb

# Additional Camera Driver
sudo apt install -y v4l2loopback-dkms
sudo modprobe v4l2loopback
