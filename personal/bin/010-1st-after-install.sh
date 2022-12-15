#!/bin/bash
# Based on: https://github.com/erikdubois/arcolinux-nemesis
#
# @ToDo
# personal moet gedaan voordat dit script in ~/bin staat, misschien eerst testen of dat gebeurd is?
set -e
echo "################################################################"
echo "####             SYSTEM DETECTION                            ###"
echo "################################################################"
set -e

shopt -s nocasematch

case $(systemd-detect-virt) in

  none)
    echo "Physical Hardware"
    ;;

  *)
    echo "Virtual Machine -> installing qemu-guest-agent"
    sudo pacman -S qemu-guest-agent
    echo "Setting video resoltion for this VM"
    xrandr --output Virtual-1 --mode 1920x1080 --auto
    ;;
esac

# Laptop detection
if [ -d "/proc/acpi/button/lid" ]; then
    echo "computer is a laptop -> installing and enabling TLP for battery-savings"
    sudo pacman -S tlp
    sudo systemclt enable tlp.service
    sudo systemctl start tlp.service
fi


echo "################################################################"
echo "####             PERSONAL i3 STUF                            ###"
echo "################################################################"
rm -R ~/.config/i3//*
cp -r ~/bin/i3/* ~/.config/i3/
chmod +x ~/.config/i3/start-conky-i3statusbar.sh
cp ~/bin/autostart/xfce4-clipman-plugin-autostart.desktop ~/.config/autostart/xfce4-clipman-plugin-autostart.desktop

echo "################################################################"
echo "###################    PERSONAL STUF DONE #####################"
echo "################################################################"


echo "################################################################"
echo "####             Enable THERMALD                             ###"
echo "################################################################"
 
systemctl enable thermald
systemctl start thermald

echo "################################################################"
echo "###################    THERMALD enabled   ######################"
echo "################################################################"


echo "################################################################"
echo "####             Enable GUFW simple firewall                 ###"
echo "################################################################"
 
sudo ufw enable
systemctl enable ufw
systemctl start ufw

echo "################################################################"
echo "###################    GUFW enabled       ######################"
echo "################################################################"


echo "################################################################"
echo "####             MKCERT - needed for DDEV                    ###"
echo "################################################################"
# Nodig voor ddev
mkcert -install

echo "################################################################"
echo "###################    MKCERT -install done ####################"
echo "################################################################"


echo "################################################################"
echo "####             CREATE KEYPAIR                              ###"
echo "################################################################"
# create keypair - ook voor GIT nodig
ssh-keygen

echo "################################################################"
echo "###################    KEYPAIR GENERATED    ####################"
echo "################################################################"


echo "################################################################"
echo "####             SETUP DOCKER                                ###"
echo "################################################################"

sudo usermod -aG docker $USER
systemctl enable docker
systemctl start docker

echo "################################################################"
echo "###################    DOCKER SETUP DONE    ####################"
echo "################################################################"


echo ""
echo "################################################################"
echo "####             Configuring GIT                             ###"
echo "################################################################"
echo ""
# change into your name and email.
git init
git config --global user.name "Tahooft"
git config --global user.email "tahooft@gmail.com"
sudo git config --system core.editor vim
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=18000'
git config --global push.default simple

echo "################################################################"
echo "###################    GIT configured     ######################"
echo "################################################################"


echo "################################################################"
echo "####             WHAT TO DO NOW?                             ###"
echo "################################################################"

echo "Arch Linux Tweaktool:"
echo "   - AUDIO -> Alsa & Pipewire - Pulseaudio exit"
echo "   - SAMBA installeren"
echo "Maybe..."
echo "   - opennic-up dns updater/extra nameservers for security (aur)"
echo "   - shortwave"
echo "   - megasync (aur)"
echo "Have a look at..."
echo "   - AppArmor"
echo "################################################################"
