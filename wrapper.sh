#!/bin/sh

echo installing git
pacman -Sy --noconfirm
pacman -S git --noconfirm

echo cloning install files
git clone https://github.com/marnyg/arch

cd arch
./install --disk /dev/sda
