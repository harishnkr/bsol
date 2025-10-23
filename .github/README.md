# Blue Screen of Life

Embrace the Blue Screen. 

Own this grub theme. Make it the first thing you see...

![preview image](preview.png)

# How to Install

> :warning: **Make sure you understand what you are doing. Installation of the theme can cause problems in your system if done incorrectly** 


## Manual Installation (preferred method) 

- Clone the repo 

```
git clone https://github.com/harishnkr/bsol.git
```

- Copy the entire `bsol/` directory to `/boot/grub/themes/` or similar path depending on your distribution

- Change the `GRUB_THEME` line in `/etc/default/grub` file:

```
GRUB_THEME="/boot/grub/themes/bsol/theme.txt"
```

- For Fedora based systems only: Change the `GRUB_ENABLE_BLSCFG` and `GRUB_TERMINAL_OUTPUT` line in `/etc/default/grub` file:
```
GRUB_ENABLE_BLSCFG="false"
GRUB_TERMINAL_OUTPUT="gfxterm"
```

- Update GRUB with sudo privileges.

For Arch based systems:

```
sudo grub-mkconfig -o /boot/grub/grub.cfg
```


For Debian based systems:

```
sudo update-grub
```

For Fedora based systems:
```
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
```

## Using Package manager

If you use Arch linux or derivatives, use this [package](https://aur.archlinux.org/packages/grub-theme-bsol-git)
run `grub-install --themes=bsol` followed by `grub-mkconfig -o /boot/grub/grub.cfg"` both with `sudo` privileges.


## Configuration

### Fonts

There are three texts where fonts can be controlled in the configuration:

- The "terminal-font", which is used when we switch to the terminal mode.
- The "item_font", which is used on each of the boot entries.
- The text "font", which is used in the countdown.

All these fonts are configured in the `theme.txt` file.

By default, the theme uses `victor mono italic` font with various font sizes for each of the texts.

### Creating custom fonts

> [!NOTE]  
> In the inital version, I used the font [Weknow Windows font](https://www.1001freefonts.com/weknow-windows.font) but changed to Victor Mono Italic. This information is for those who wants to use the old font but dont know the origin of the font.

In order to use custom font for each of the texts that I mentioned above, you can use the [grub-mkfont](https://man.archlinux.org/man/grub-mkfont.1.en) utility to create them. Make sure you have the original font in ttf or other supported format. The command to make the font is as follows:

```
grub-mkfont --output=output_file.pf2 input_file
```

Here the input file specified must be the font file, and the output file specified must be in the ".pf2" format. The files must be in the same folder as the theme.txt file. The font size can also be specified using the `--size=N` where N is in integer value.

To change the fonts, change the line containing the font in the `theme.txt` file.

To see the changes, check the [Preview](#preview-theme) section

## Preview Theme

The themes can be previewed using the [grub2-theme-preview](https://aur.archlinux.org/packages/grub2-theme-preview) package. To view the theme just type the command in the bsol directory:

```
grub2-theme-preview bsol 
```

If the theme viewer does not popup for any reason (for example using Wayland), you can use VNC viewer, for example [TigerVNC](https://wiki.archlinux.org/title/TigerVNC) to view it by giving the command:

```
vncviewer localhost
```


## Troubleshooting

Some fixes for issues that may help are as follows. All feedbacks are appreciated

- Make sure this line is commented with a `#` in the beginning:
    ```
    GRUB_TERMINAL_OUTPUT="console"
    ```
- Change resolution with this line:
    ```
    GRUB_GFXMODE="[x_res]x[y_res]x32"
    ```
    (change x_res and y_res to your screen resolution, e.g. 1920x1080)

# TODO

- Update the packages on Pling.com, Gnome-look and Opendesktop sites
- Create install script for various distros

# Credits


- [This amazing guide](http://wiki.rosalab.ru/en/index.php/Grub2_theme_tutorial)
- [y0uCeF](https://github.com/y0uCeF) for helping with the AUR package
- [This repo](https://github.com/Jacksaur/Gorgeous-GRUB) for showcasing various themes.
