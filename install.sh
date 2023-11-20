sudo apt update

sudo add-apt-repository "deb http://download.webmin.com/download/repository sarge contrib"

sudo apt install software-properties-common apt-transport-https wget

wget -q -O- http://www.webmin.com/jcameron-key.asc | sudo apt-key add

sudo apt update

apt-key list

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys


sudo apt install webmin

sudo ufw allow 10000

setelah instalasi selesai kita bisa akses control panel melalui webbrowser 

https://ipserver:10000
