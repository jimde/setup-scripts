#!/bin/bash

wget -o Minecraft.deb https://launcher.mojang.com/download/Minecraft.deb
sudo apt install gdebi-core
sudo gdebi Minecraft.deb.1
