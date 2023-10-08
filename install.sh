#!/data/data/com.termux/files/usr/bin/sh

#Adding colors
R="$(printf '\033[1;31m')"
G="$(printf '\033[1;32m')"
Y="$(printf '\033[1;33m')"
W="$(printf '\033[1;37m')"
C="$(printf '\033[1;36m')"

banner(){
clear
printf ${C}"██╗░░██╗██╗██╗\n"
printf     "╚██╗██╔╝██║██║\n"
printf     "░╚███╔╝░██║██║\n"
printf     "░██╔██╗░██║██║\n"
printf     "██╔╝╚██╗██║██║\n"
printf     "╚═╝░░╚═╝╚═╝╚═╝\n"
printf     ".                     \n"
printf     "████████╗██╗░░██╗░░░░░██╗  ░█████╗░\n"
printf     "╚══██╔══╝██║░██╔╝░░░░░██║  ██╔══██╗\n"
printf     "░░░██║░░░█████═╝░░░░░░██║  ███████║\n"
printf     "░░░██║░░░██╔═██╗░██╗░░██║  ██╔══██║\n"
printf     "░░░██║░░░██║░╚██╗╚█████╔╝  ██║░░██║\n"
printf     "░░░╚═╝░░░╚═╝░░╚═╝░╚════╝░  ╚═╝░░╚═╝\n"${W}
printf ${Y}"                By Technical Bot\n"${W}
printf ${Y}"                Revision Putra Atmaja\n"${W}
}



CHROOT=$PREFIX/var/lib/proot-distro/installed-rootfs/ubuntu

proses_install_os(){
echo
if [[ -d "$PREFIX/var/lib/proot-distro/installed-rootfs/ubuntu" ]]; then
echo ${G}"Existing Ubuntu installation found, Resetting it..."${W}
proot-distro reset ubuntu
else
echo ${G}"Installing Ubuntu..."${W}
echo
pkg update
pkg install proot-distro
proot-distro install ubuntu
fi
}

install_dekstop_tunggu_aja(){
echo ${G}"Mungkin bakal agak lama sabar aja..."${W}
cat > $CHROOT/root/.bashrc <<- EOF
apt-get update
apt install udisks2 -y
rm -rf /var/lib/dpkg/info/udisks2.postinst
echo "" >> /var/lib/dpkg/info/udisks2.postinst
dpkg --configure -a
apt-mark hold udisks2
apt-get install xfce4 gnome-terminal nautilus dbus-x11 tigervnc-standalone-server -y
echo "vncserver -geometry 1280x720 -xstartup /usr/bin/startxfce4" >> /usr/local/bin/vncstart
echo "vncserver -kill :* ; rm -rf /tmp/.X1-lock ; rm -rf /tmp/.X11-unix/X1" >> /usr/local/bin/vncstop
chmod +x /usr/local/bin/vncstart 
chmod +x /usr/local/bin/vncstop 
sleep 2
exit
echo
EOF
proot-distro login ubuntu 
rm -rf $CHROOT/root/.bashrc
}

penambahan_userr(){
echo ${G}"User XII TKJ A PW:ghghgh..."${W}
cat > $CHROOT/root/.bashrc <<- EOF
apt-get update
apt-get install sudo wget -y
sleep 2
useradd -m -s /bin/bash xiitkja
echo "xiitkja:ghghgh" | chpasswd
echo "xiitkja  ALL=(ALL:ALL) ALL" >> /etc/sudoers.d/ubuntu
sleep 2
exit
echo
EOF
proot-distro login ubuntu
echo "proot-distro login --user xiikja ubuntu" >> $PREFIX/bin/ubuntu
chmod +x $PREFIX/bin/ubuntu
rm $CHROOT/root/.bashrc
}

tambahan(){
echo ${G}"Bentar kok hehe"${W}
cat > $CHROOT/root/.bashrc <<- EOF
echo "deb http://ftp.debian.org/debian stable main contrib non-free" >> /etc/apt/sources.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv-keys 648ACFD622F3D138
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv-keys 0E98404D386FA1D9
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv-keys 605C66F00D6C9793
apt update
apt install firefox-esr gedit -y
exit
EOF
proot-distro login ubuntu
rm $CHROOT/root/.bashrc
}

fix_suara(){
echo ${G}"Dikit Lagi..."${W}
pkg update
pkg install x11-repo -y ; pkg install pulseaudio -y
cat > $HOME/.bashrc <<- EOF
pulseaudio --start \
    --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" \
    --exit-idle-time=-1
EOF

mv $CHROOT/home/ubuntu/.bashrc $CHROOT/home/ubuntu/.bashrc.bak
cat > $CHROOT/home/ubuntu/.bashrc <<- EOF
vncstart
sleep 4
DISPLAY=:1 firefox &
sleep 10
pkill -f firefox
vncstop
sleep 4
exit
echo
EOF
ubuntu
rm $CHROOT/home/ubuntu/.bashrc
mv $CHROOT/home/ubuntu/.bashrc.bak $CHROOT/home/ubuntu/.bashrc
wget -O $(find $CHROOT/home/ubuntu/.mozilla/firefox -name *.default-esr)/user.js https://raw.githubusercontent.com/TecnicalBot/modded-distro/main/fixes/user.js
}

final_banner(){
banner
echo
echo ${G}"SELESAI DEH GAMPANG KAN?
echo
echo "ubuntu  -  Buat mulai Ubuntu"
echo
echo "ubuntu  -  Password bawaan"
echo
echo "vncstart  -  Buat mulai vncserver nya, Execute inside ubuntu"
echo
echo "vncstop  -  Buat stop vncserver nya, Execute inside ubuntu"${W}
rm -rf ~/install.sh
}

banner
install_ubuntu
install_desktop
install_extra
adding_user
install_theme
sound_fix
final_banner
