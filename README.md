# Arc DWM Dotfiles

## General Info

| Type          | Name                                                                                               |
|---------------|----------------------------------------------------------------------------------------------------|
| GTK Theme     | [Arc-Dark](https://github.com/jnsh/arc-theme)                                                      |
| Icon Theme    | [Arc](https://github.com/horst3180/arc-icon-theme)                                                 |
| Cursor Theme  | [Capitaine Cursors](https://github.com/keeferrourke/capitaine-cursors)                             |
| Firefox Theme | [Arc Dark Theme](https://addons.mozilla.org/en-US/firefox/addon/arc-dark-theme-we/)                |
| WM            | [dwm](https://github.com/Zaedus/dwm-arc) w/ customization                                          |
| Launcher      | [dmenu](https://github.com/Zaedus/dmenu-arc) w/ customization                                      |
| Blocks        | [dwmblocks](https://github.com/Zaedus/dwmblocks-arc) w/ customization                              |
| Terminal      | [alacritty](https://github.com/alacritty/alacritty)                                                |
| Browser       | firefox or [ungoogled chromium](https://github.com/Eloston/ungoogled-chromium)                     |
| Spotify Theme | [Arc Dark](https://github.com/morpheusthewhite/spicetify-themes/wiki/Themes-preview#arc-dark)      |
| Notifications | [dunst](https://github.com/dunst-project/dunst)                                                    |
| Compositor    | [picom (jonaburg)](https://github.com/jonaburg/picom)                                              |
| File Manager  | [nautilus](https://github.com/GNOME/nautilus)                                                      |

## Install Instructions

> Note: This is intended for Arch Linux. You can feasibly install all of the components on other distros, but no guarantees it works well.

### Dependencies

> Note: I use `yay`, but you can use any other AUR helper

```bash
yay -S picom-jonaburg-git dunst alacritty gtk2 gtk3 arc-icon-theme arc-gtk-theme nautilus nitrogen polkit-gnome acpi pacman-contrib checkupdates-aur alsa-utils
```

### Configs

#### dotfiles

> Note: Make sure you backup your dunst, alacritty, picom, and gtk configs before running!

```bash
git clone https://github.com/Zaedus/arc-dotfiles.git
cd arc-dotfiles
cp -r .dwm ~
cp -r .config ~
```

#### dwm

```bash
git clone https://github.com/Zaedus/dwm-arc.git
cd dwm-arc
make
sudo make clean install
```

#### dwmblocks

```bash
git clone https://github.com/Zaedus/dwmblocks-arc.git
cd dwmblocks-arc
make
sudo make clean install
```

#### dmenu

```bash
git clone https://github.com/Zaedus/dmenu-arc.git
cd dmenu-arc
make
sudo make clean install
```