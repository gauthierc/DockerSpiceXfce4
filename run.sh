SPICE_RES=${SPICE_RES:-"1280x960"}
SPICE_LOCAL=${SPICE_LOCAL:-"fr_FR.UTF-8"}
TIMEZONE=${TIMEZONE:-"Europe/Paris"}
SPICE_USER=${SPICE_USER:-"user"}
SPICE_UID=${SPICE_UID:-"1000"}
SPICE_GID=${SPICE_GID:-"1000"}
SPICE_PASSWD=${SPICE_PASSWD:-"password"}
SPICE_KB=`echo "$SPICE_LOCAL" | awk -F"_" '{print $1}'` 
locale-gen $SPICE_LOCAL
echo $TIMEZONE > /etc/timezone
useradd -ms /bin/bash -u $SPICE_UID $SPICE_USER
echo "$SPICE_USER:$SPICE_PASSWD" | chpasswd
sed -i "s|#Option \"SpicePassword\" \"\"|Option \"SpicePassword\" \"$SPICE_PASSWD\"|" /etc/X11/spiceqxl.xorg.conf
unset SPICE_PASSWD
update-locale LANG=$SPICE_LOCAL
sed -i "s/XKBLAYOUT=.*/XKBLAYOUT=\"$SPICE_KB\"/" /etc/default/keyboard
sed -i "s/SPICE_KB/$SPICE_KB/" /etc/xdg/autostart/keyboard.desktop
sed -i "s/SPICE_RES/$SPICE_RES/" /etc/xdg/autostart/resolution.desktop
cd /home/$SPICE_USER
su $SPICE_USER -c "/usr/bin/Xorg -config /etc/X11/spiceqxl.xorg.conf -logfile  /home/$SPICE_USER/.Xorg.2.log :2 &"
su $SPICE_USER -c "DISPLAY=:2 /usr/bin/xfce4-session"
