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

Ada beberapa control panel webserver yang mudah dan gratis yang bisa anda coba untuk instalasi di Ubuntu, di antaranya:

1. Webmin
Webmin merupakan control panel webserver yang populer dan mudah digunakan. Anda dapat menginstalnya dengan mengikuti langkah-langkah berikut:

- Buka terminal di Ubuntu.
- Ketik perintah berikut untuk menambahkan repository Webmin ke sistem anda: 
```
sudo sh -c 'echo "deb http://download.webmin.com/download/repository sarge contrib" > /etc/apt/sources.list.d/webmin.list'
```
- Selanjutnya, tambahkan kunci GPG Webmin dengan perintah berikut:
```
wget http://www.webmin.com/jcameron-key.asc
sudo apt-key add jcameron-key.asc
```
- Update repository dengan mengetik perintah:
```
sudo apt-get update
```
- Terakhir, instal Webmin dengan perintah:
```
sudo apt-get install webmin
```

2. ISPConfig
ISPConfig juga merupakan pilihan yang baik untuk control panel webserver gratis. Berikut adalah cara instalasi ISPConfig di Ubuntu:

- Buka terminal di Ubuntu.
- Tambahkan repository ISPConfig ke sistem anda dengan perintah berikut:
```
sudo apt-get update
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:ondrej/php
```
- Update repository dengan mengetik perintah:
```
sudo apt-get update
```
- Instal ISPConfig dengan perintah:
```
wget -O - https://get.ispconfig.org | sudo bash
```

Dengan mengikuti langkah-langkah di atas, Anda dapat dengan mudah menginstal control panel webserver gratis seperti Webmin atau ISPConfig di Ubuntu. Pastikan untuk mengikuti instruksi instalasi dengan hati-hati dan memeriksa kebutuhan sistem sebelum menginstal.
