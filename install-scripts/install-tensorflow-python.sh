#!/bin/sh
sudo apt-get -y install python-pip python-dev   # for Python 2.7
sudo apt-get -y install python3-pip python3-dev # for Python 3.n

sudo pip install tensorflow      # Python 2.7; CPU support (no GPU support)
sudo pip3 install tensorflow     # Python 3.n; CPU support (no GPU support)
# pip install tensorflow-gpu  # Python 2.7;  GPU support
# pip3 install tensorflow-gpu # Python 3.n; GPU support 

