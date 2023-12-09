#!/data/data/com.termux/files/usr/bin/sh

#Adding colors
R="$(printf '\033[1;31m')"
G="$(printf '\033[1;32m')"
Y="$(printf '\033[1;33m')"
W="$(printf '\033[1;37m')"
C="$(printf '\033[1;36m')"

banner(){
clear
printf ${C}"
██╗░░██╗██╗██╗
╚██╗██╔╝██║██║
░╚███╔╝░██║██║
░██╔██╗░██║██║
██╔╝╚██╗██║██║
╚═╝░░╚═╝╚═╝╚═╝

████████╗██╗░░██╗░░░░░██╗  ░█████╗░
╚══██╔══╝██║░██╔╝░░░░░██║  ██╔══██╗
░░░██║░░░█████═╝░░░░░░██║  ███████║
░░░██║░░░██╔═██╗░██╗░░██║  ██╔══██║
░░░██║░░░██║░╚██╗╚█████╔╝  ██║░░██║
░░░╚═╝░░░╚═╝░░╚═╝░╚════╝░  ╚═╝░░╚═╝\n"${W}
printf ${Y}"                By Dea Yudistira\n"${W}
}





add_repo(){
echo
else
echo ${G}"Menambahkan repository"${W}
echo
sudo sh -c 'echo "deb http://download.webmin.com/download/repository sarge contrib" > /etc/apt/sources.list.d/webmin.list'
fi
}

add_gpg(){
echo ${G}"Menambahkan kunci GPG :3"${W}
wget http://www.webmin.com/jcameron-key.asc
sudo apt-key add jcameron-key.asc
}

update_repo(){
echo ${G}"Update repository (emg agak lama sabar aja)"${W}
sudo apt-get update
}

install_webmin(){
echo ${G}"Installing webmin"${W}
sudo apt-get install webmin
}

ufw_allow(){
sudo ufw allow 10000
}

final_banner(){
banner
echo
echo ${G}"Installion webmin completed"
echo
echo "buka browser lalu ketik : https://ipserver:10000"
echo
echo "buat cek ip server nya ketik : iip a"${W}
rm -rf ~/CPW.sh
}

banner
add_repo
add_gpg
update_repo
install_webmin
ufw_allow
final_banner
