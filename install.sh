#!/bin/bash
GRUB_CFG="/etc/default/grub"
THEME_NAME="bsol"
echo "Welcome to installing the blue screen of life"

# user must script as root
if [[ $(id -u) -ne 0 ]]; then
	echo "Must run script as root (sudo)"
	exit
else
	echo "Script is running with root permissions... continuing"
fi

# check if the grub folder is called grub/ or grub2/
echo "looking for grub folder"
if [ -d /boot/grub ]; then
    GRUB_PATH="/boot/grub"
elif [ -d /boot/grub2 ]; then
    GRUB_PATH="/boot/grub2"
else
    echo "Can't find a /boot/grub or /boot/grub2 folder. Exiting."
    exit
fi
echo "grub folder is: $GRUB_PATH"
THEME_PATH="$GRUB_PATH/themes"

# making the path and copying files
mkdir -p "$THEME_PATH"
cp -ru ./bsol/ $THEME_PATH
if [ $? -eq 0 ]; then
    echo "sucessfully copied files to: $THEME_PATH"
else
    echo "Failed to copy files to: $THEME_PATH"
    exit 1
fi

# write to grub config file
echo "Writing to config file: $GRUB_CFG"
if grep -q "GRUB_THEME=" "$GRUB_CFG"; then
    echo "writing to grub"
    sed -i "s|^GRUB_THEME=.*|GRUB_THEME=\"${THEME_PATH}/${THEME_NAME}/theme.txt\"|" "$GRUB_CFG"
    
    # this one here checks if the line is commented out uhh peak programmering for sure
    sed -i "s|^#GRUB_THEME=.*|GRUB_THEME=\"${THEME_PATH}/${THEME_NAME}/theme.txt\"|" "$GRUB_CFG"
else
	echo "Failed to insert theme into $GRUB_CFG (do it manually yourself)"
	exit
fi



if command -v grub-mkconfig > /dev/null 2>&1; then
    echo "GRUB is installed. Updating config..."
    sudo grub-mkconfig -o /boot/grub/grub.cfg > /dev/null 2>&1
else
    echo "GRUB not found. Skipping boot update."
    exit 1
fi




echo "---- Install script complete ----"
echo "Credits to harishnkr for the original projects: https://github.com/harishnkr/bsol"
