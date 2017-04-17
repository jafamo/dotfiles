#!/bin/bash


function cleanCache(){

	echo "### cleaning packages from: /var/cachepacman/pkg"

	sudo pacman -Sc

	echo "### cleaned cache system."
	echo
	echo
	echo "### Delete old packages "
	sudo pacman -Scc

}

function optimizeSystem(){
	sudo pacman-optimize && sync
	sudo updatedb
	exit 0
}

read -p "Do you want clean Cache?  (s/n)  " option
if [ "${option,,}" = "s" ]; then
	cleanCache
else
	echo "no cache and exit"
fi

read -p "Do you want optimize your system (s/n) " optionOptimi
if [ "${optionOptimi,,}" = "s" ]; then
	optimizeSystem
else
	echo "no optimized your system"
fi

