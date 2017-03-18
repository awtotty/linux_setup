#!/bin/bash

### This script creates the custom Ubuntu environment prefered for user austin.
### It should be run after a clean install of Ubuntu.

## Install from existing repositories
echo "\n## Insatlling vim, git, unity-tweak-tool, chromium, powertop ##\n"
apt-get update
# Install vim, git, unity-tweak-tool, chromium-browser, powertop
apt-get install vim git unity-tweak-tool chromium-browser powertop
echo "Done"

## Install paper theme
echo "\n## Installing paper theme ##\n"
sudo add-apt-repository ppa:snwh/pulp
sudo apt-get update
sudo apt-get install paper-icon-theme
sudo apt-get install paper-gtk-theme
sudo apt-get install paper-cursor-theme
echo "Done"

## Install Spotify
echo "\n## Installing Spotify ##\n"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client
echo "Done"

## Install flux
echo "\n## Installing flux ##\n"
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

## Install atom
echo "\n## Opening Atom download link ##\n"
chromium-browser  https://atom.io

## Install anaconda
echo "\n##Opening Anaconda download link ##\n"
chromium-browser  https://www.continuum.io/downloads

## Open google photos wallpapers album
echo "\n## Opening wallpapers link ##\n"
chromium-browser https://photos.google.com/album/AF1QipPuyPGXlU5ihaDH5cHCH0Maa3dM7OCXHRlirfhm

## Additional drivers
echo "\n## Adding graphics-drivers via ppa ##\n"
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-get update
echo "Done"
echo "\n## Don't forget to install the relevant graphics drivers for this system! ##\n"

## Exit message
echo "\n## Done installing default packages. A restart is likely required. ##"
echo "Do you wish to restart now? [Y/n]"
select ans in "Yes" "No" "Y" "y" "N" "n"
do
    case $ans in
        "Yes"|"Y"|"y" ) reboot; break;;
        "No"|"N"|"n" ) break;;
    esac
done
