#!/bin/bash

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove

##############################
#install useful tools
##############################
sudo apt-get -y install terminator
sudo apt-get -y install git
sudo apt-get -y install gitg
sudo apt-get -y install htop
sudo apt-get -y install meld

##############################
# set up case insensitive autocomplete
##############################
if [ ! -a ~/.inputrc ]; then echo '$include /etc/inputrc' > ~/.inputrc; fi
echo 'set completion-ignore-case On' >> ~/.inputrc

##############################
# install nvidia drivers
##############################
sudo apt-get purge nvidia*
sudo add-apt-repository ppa:graphics-drivers
sudo apt-get update
# sudo apt-get install nvidia-###
# sudo apt-mark hold nvidia-###
# lsmod | grep nvidia # to check if drivers are running
# lsmod | grep nouveau # this should not print anything if nvidia drivers were installed properly
# http://www.linuxandubuntu.com/home/how-to-install-latest-nvidia-drivers-in-linux

##############################
# install intel display drivers
##############################
sudo apt-get install intel-microcode
# http://ubuntuhandbook.org/index.php/2016/04/switch-intel-nvidia-graphics-ubuntu-16-04/

##############################
# install spotify
##############################
# 1. Add the Spotify repository signing keys to be able to verify downloaded packages
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410
# 2. Add the Spotify repository
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
# 3. Update list of available packages
sudo apt-get update
# 4. Install Spotify
sudo apt-get install spotify-client

##############################
# install atom
##############################
sudo add-apt-repository ppa:webupd8team/atom
sudo apt update
sudo apt install atom

##############################
# reduce size of titlebars
##############################
cat setup-jimmy-ubuntu-gnome-titlebars.css >> ~/.config/gtk-3.0/gtk.css
# press alt + F2, then type 'r' to reload gnome shell
# https://unix.stackexchange.com/questions/276951/how-to-change-the-titlebar-height-in-standard-gtk-apps-and-those-with-headerbars

# power/performance management
# https://extensions.gnome.org/extension/945/cpu-power-manager/
# get gnome shell version with 'gnome-shell --version'

