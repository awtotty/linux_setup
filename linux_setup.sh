#!/bin/bash

### This script creates the custom Ubuntu environment prefered for user austin.
### It should be run after a clean install of Ubuntu.

## Install from existing repositories
echo
echo "## Insatlling vim, git, docker, tmux, chromium, powertop, tlp ##"
sudo apt update
# Install vim, git, docker, tmux, chromium-browser, powertop,
sudo apt install vim git docker tmux chromium-browser powertop tlp
echo "Done"

## Install gnome desktop
echo
echo "## Installing gnome desktop ##"
sudo apt install ubuntu-gnome-desktop

## Install paper theme
echo
echo "## Installing paper theme ##"
sudo add-apt-repository ppa:snwh/pulp
sudo apt-get update
sudo apt-get install paper-icon-theme
sudo apt-get install paper-gtk-theme
sudo apt-get install paper-cursor-theme
echo "Done"

## Install Spotify
echo
echo "## Installing Spotify ##"
echo
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client
echo "Done"

## Install caffeine
echo 
echo "## Installing caffeine ##"
echo
sudo add-apt-repository ppa:caffeine-developers/ppa
sudo apt-get update
sudo apt-get install caffeine
echo "Done"

## Install flux
echo
echo "## Installing flux ##"
echo
# Install dependencies
sudo apt-get install git python-appindicator python-xdg python-pexpect python-gconf python-gtk2 python-glade2 libxxf86vm1
# Download xflux-gui
cd /tmp
git clone "https://github.com/xflux-gui/xflux-gui.git"
cd xflux-gui
python download-xflux.py
# Install globally
sudo python setup.py install
echo "Done"

# Set default browser
xdg-settings set default-web-browser chromium-browser.desktop

## Install atom
echo
echo "## Opening Atom download link ##"
echo
xdg-open https://atom.io

## Install anaconda
echo
echo "##Opening Anaconda download link ##"
echo
xdg-open https://www.continuum.io/downloads

## Install Steam
echo
echo "##Opening Steam download link ##"
echo
xdg-open http://store.steampowered.com/about/

## Open google photos wallpapers album
echo
echo "## Opening wallpapers link ##"
xdg-open https://photos.google.com/album/AF1QipPuyPGXlU5ihaDH5cHCH0Maa3dM7OCXHRlirfhm

## Additional drivers
echo
echo "## Adding graphics-drivers via ppa ##"
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-get update
echo "Done"
echo "## Don't forget to install the relevant graphics drivers for this system! ##"

## Upgrade
sudo apt-get update
sudo apt-get upgrade
sudo apt-get clean
sudo apt-get autoremove

## Exit message
echo
echo "## Done installing packages. A restart is likely required. ##"
