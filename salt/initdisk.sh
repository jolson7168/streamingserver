#!/bin/sh
hdd="/dev/xvdb"
for i in $hdd;do
echo "n
p
1


w
"|sudo fdisk $i;sudo mkfs.ext4 $i;done
sudo mkdir /mnt/data
sudo mount /dev/xvdb /mnt/data
echo "/dev/xvdb /mnt/data   auto   defaults,nobootwait,comment=cloudconfig 0 2" >>/etc/fstab 
