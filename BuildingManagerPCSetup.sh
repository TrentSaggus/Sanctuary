#!/bin/bash

# Install new Package Manager
echo "Installing Nala Package Manager ..."
sudo apt install nala -y

# Update the system
echo "Updating the system ..."
sudo nala update
sudo nala upgrade -y

# Remove LibreOffice
echo "Removing Unneeded Applications ..."
sudo nala remove -y libreoffice*
sudo nala remove -y transmission remmina

# Install ONLYOFFICE, Flatpak, Firefox, Thunderbird, and Bitwarden
echo "Installing required applications ..."
sudo nala install -y onlyoffice-desktopeditors flatpak firefox thunderbird htop

# Install and Setup flatpak for first use
echo "Installing and Setting Up Flatpak for Use"
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install required Flatpaks
echo "Installing required flatpaks ..."
flatpak install -y flathub com.bitwarden.desktop

# Download and apply Firefox policies
echo "Configuring Firefox ..."
wget https://raw.githubusercontent.com/TrentSaggus/Sanctuary/main/config/policies.json -O /tmp/policies.json
sudo mkdir -p /usr/lib/firefox/distribution
sudo mv /tmp/policies.json /usr/lib/firefox/distribution/policies.json
sudo mkdir -p /etc/firefox/policies
sudo cp /usr/lib/firefox/distribution/policies.json /etc/firefox/policies/policies.json

# Additional system configurations and cleanup can go here

echo "Setup complete."