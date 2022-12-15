### Enable smartctl
#sudo smartctl -s on /dev/sdx
# Enable weekly trim of ssd
#systemctl enable fstrim.timer


###########################################################################
#                                SYSTEEM VEILIGHEID
###########################################################################

#arch-audit > arch-audit     # Audit van de geinstalleerde pakketten
#sudo lshw > lshw.txt        # Overzicht van het systeem
#grep -r . /sys/devices/system/cpu/vulnerabilities/
#
##  Add the following line to /etc/pam.d/system-login to add a delay of at least 4 seconds between failed login attempts:
#auth optional pam_faildelay.so delay=4000000
#
#Lees: https://wiki.archlinux.org/title/GNOME/Keyring
#
## When using console-based login, edit /etc/pam.d/login:
#- Add: auth optional pam_gnome_keyring.so    at the end of the auth section 
#- and: session optional pam_gnome_keyring.so auto_start   at the end of the session section. 


###########################################################################
#                                OVERWEGEN
###########################################################################
#i3keys
#glances (Conky alternative)
#lynis - security audit (sudo lynis audit system)
#rkhunter (rootkit hunter)
#opennic-up	add nameservers (lynis audit advices more then one nameserver...)
#goverlay - framerate van games 
#obsidian - notes / brain / 
#ncdu - tui voor overzicht diskruimte
#linphone - voip on pc and mobile
#wireshark	monitor netwerk
#kismet - Ontdekt alle wifi's  
#darkstat - Network statistics gatherer (packet sniffer)
#gnome-boxes
#phoronix-test-suite (voor https://openbenchmarking.org/s)
#video-trimmer (Flatpak)

#https://www.youtube.com/watch?v=s0SyDa70l6w --- 10 best


###########################################################################
#                                LAPTOP SPECIFIC
###########################################################################

#https://wiki.archlinux.org/title/Laptop
#    https://wiki.archlinux.org/title/Backlight
#    https://wiki.archlinux.org/title/Fingerprint_GUI
#
#
#
#laptop-mode-tools - AUR - If nothing happens on launch (and you're expecting a GUI), install python-pyqt5
#thermald - Linux daemon used to prevent the overheating of Intel CPUs.
#    thermald.service enable 
#
#
#fingerprint-gui - fingerprint reader voor laptop – nog niet werkend te krijgen...
#cbatticon - battery icon - https://github.com/valr/cbatticon

###########################################################################
#                                VSCode extensions
###########################################################################
#mermaid
#docker
#github pull requests and issues
#gitlent
#.run - coderunner (overwegen)