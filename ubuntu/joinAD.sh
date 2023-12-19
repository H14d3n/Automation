#/!/bin/bash

# Install required packages
sudo apt update 
sudo apt install realmd sssd samba-common samba-common-bin samba-libs oddjob oddjob-mkhomedir packagekit samba samba-common krb5-user adcli ntp

# Join active directory with code (uncomment if needed)
# sudo realm join --user=administrator funid.local

# Stop sssd service for pam update
sudo systemctl stop sssd

# PAM-Auth update
echo '[Domain]' | sudo tee -a /etc/security/pam_winbind.conf

# Start ssd service 
sudo systemctl start sssd
sudo systemctl restart sssd
sudo apt update && sudo apt upgrade
