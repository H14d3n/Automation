#/!/bin/bash

# Be careful with this script, as it can harm your computer
# This Script contains various Ubuntu package repositories.

sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(mantic) main"

sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(mantic) restricted"

sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(mantic) universe"

sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(mantic) multiverse"

sudo apt update


