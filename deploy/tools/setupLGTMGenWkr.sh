#!/bin/sh


apt-get -y update
apt-get -y install samba
apt-get -y install cifs-utils
apt-get -y update
mkdir /media/lgtmshare
chmod -R a+rwx /media/lgtmshare
cp /etc/fstab /etc/fstab.orig
echo "//10.1.0.77/sambashare  /media/lgtmshare cifs guest,uid=ubuntu,iocharset=utf8,file_mode=0777,dir_mode=0777,noperm 0 0" >> /etc/fstab
mount /media/lgtmshare/
ls /media/lgtmshare/
hostnamectl set-hostname lgtm_general
echo lgtm_general > /etc/hostname
echo "# LGTM Lookups " >> /etc/hosts
echo "127.0.0.1 lgtm_general" >> /etc/hosts
echo "10.1.0.77 lgtm.moat.blog" >> /etc/hosts
echo "10.1.0.77 ip-10-1-0-77" >> /etc/hosts
hostname
cd /tmp
apt-get -y install openjdk-8-jdk
/media/lgtmshare/dist/setupDevU18.sh
mkdir /lgtm-releases
chmod -R a+rwx /lgtm-releases/
cd /lgtm-releases
cp -r /media/lgtmshare/dist/lgtm-1.19.1 .
cd lgtm-1.19.1/generated/lgtm_general/
./install-machine.sh
cd /tmp
/media/lgtmshare/dist/setupDevU18.sh
sudo -u lgtm-worker chmod 0600 /var/lib/lgtm-worker/.ssh/*

cd /tmp
cp -r /media/lgtmshare/dist/.ssh .
chown -R lgtm-worker:lgtm-worker .ssh
cd .ssh
chmod 0600 *
cd ..
mv .ssh /var/lib/lgtm-worker/
sudo -u lgtm-worker git clone git@git.moat.blog:nirocr/python_lib.git
sudo rm -rf python_lib/
sudo -u lgtm-worker git clone git@github.com:nirocr/python_lib.git
sudo rm -rf python_lib/
lgtm-down
lgtm-up
