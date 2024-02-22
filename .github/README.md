# Black Screen of Life

Embrace the Blue Screen. 

Own this grub theme. Make it the first thing you see...

![preview image](preview.png)

# How to Install

- Clone the repo 

```
git clone https://github.com/harishnkr/bsol.git
```

- Copy the entire `bsol/` directory to `/boot/grub/themes/` or similar path depending on your distribution

- Change the `GRUB_THEME` line in `/etc/default/grub` file:

```
GRUB_THEME="/boot/grub/themes/bsol/theme.txt"
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

# Credits

Fonts:

- Victor Mono Italic
- [Weknow Windows Font](https://www.1001freefonts.com/weknow-windows.font)


[This amazing guide](http://wiki.rosalab.ru/en/index.php/Grub2_theme_tutorial)
