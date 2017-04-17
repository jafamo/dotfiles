#!/bin/bash

echo "### cleaning packages from: /var/cachepacman/pkg"

sudo pacman -Sc

echo "### cleaned cache system."
echo
echo
echo "### Delete old packages "
sudo pacman -Scc

