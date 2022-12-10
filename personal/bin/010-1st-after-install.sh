#!/bin/bash
# https://github.com/erikdubois/arcolinux-nemesis
##################################################################################################################
# Author 	: 	Erik Dubois
# Website 	: 	https://www.erikdubois.be
# Website	:	https://www.arcolinux.info
# Website	:	https://www.arcolinux.com
# Website	:	https://www.arcolinuxd.com
# Website	:	https://www.arcolinuxforum.com
##################################################################################################################
# @ToDo
# personal moet gedaan voordat dit script in ~/bin staat, misschien eerst testen of dat gebeurd is?


set -e

echo "################################################################"
echo "####             SETTING RESOLUTION                          ###"
echo "################################################################"

xrandr --output Virtual-1 --mode 1920x1080 --auto

echo "################################################################"
echo "###################    RESOLUTION SET    ######################"
echo "################################################################"


echo "################################################################"
echo "####             DOING THE PERSONAL STUF                    ###"
echo "################################################################"
cp ~/bin/i3/config ~/.config/i3/config
cp ~/bin/i3/conky-i3statusbar ~/.config/i3/conky-i3statusbar

echo "################################################################"
echo "###################    PERSONAL STUF DONE #####################"
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
echo "   - AUDIO naar Alsa & Pipewire - Pulseaudio eruit"
echo "   - SAMBA installeren"

echo "################################################################"
