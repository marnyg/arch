#!/bin/sh

echo installing git
pacman -Sy
pacman -S git

echo cloning install files
git clone https://github.com/marnyg/arch

cd arch
./install --disk /dev/sda
