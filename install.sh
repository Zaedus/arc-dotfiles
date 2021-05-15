#!/usr/bin/env bash

## Vars ##

# Not sure if there is any other AUR helper other than paru that has the same syntax as yay, so just know that

AUR_HELPER="yay"
APP_DEPS="dunst alacritty nautilus"
BACKEND_DEPS="picom-jonaburg-git acpi pacman-contrib checkupdates-aur alsa-utils"
UTIL_DEPS="nitrogen polkit-gnome"
BUILD_DEPS="gtk2 gtk3 libx11 libxinerama libxft-bgra freetype2 git make"
THEME_DEPS="arc-icon-theme arc-gtk-theme"


install_dmenu() {
	cd /tmp
	git clone https://github.com/Zaedus/dmenu-arc.git
	cd dmenu-arc
	make
	sudo make clean install
}

install_dwmblocks() {
	cd /tmp
	git clone https://github.com/Zaedus/dwmblocks-arc.git
	cd dwmblocks-arc
	make
	sudo make clean install
}

install_dwm() {
	cd /tmp
	git clone https://github.com/Zaedus/dwm-arc.git
	cd dwm-arc
	make
	sudo make clean install
}

install_dotfiles() {
	cd /tmp
	git clone https://github.com/Zaedus/arc-dotfiles.git
	cd arc-dotfiles
	cp -r .dwm ~
	cp -r .config ~
}

backup_dotfiles() {
	echo "This is going to overwrite your alacritty, dunst, gtk-2.0, gtk-3.0, and picom configs and the '~/.dwm' directory."
	read -p "Are you sure you want to continue? [y/N] " -n 1 -r REPLY </dev/tty
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		return 0
	else
		exit
	fi
}


install_dependencies() {
	$AUR_HELPER -S $APP_DEPS $UTIL_DEPS $BUILD_DEPS $THEME_DEPS $BACKEND_DEPS
}


main() {
	if [ ! -z "$1" ]; then
		AUR_HELPER="$1"
	fi

	if [ -z "$(/usr/bin/env "$AUR_HELPER")" ]; then
		echo "Command not found: $AUR_HELPER"
		exit 1
	fi

	install_dependencies

	backup_dotfiles
	
	install_dotfiles

	install_dwm

	install_dwmblocks

	install_dmenu
}

main