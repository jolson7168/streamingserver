#!/bin/bash

export ip=`ifconfig | awk -F':' '/inet addr/&&!/127.0.0.1/{split($2,_," ");print _[1]}'`
sed -i "0,/<hostname>/s//$ip/" /home/ubuntu/socketLoader/config/writeSocket.cfg
sed -i "0,/<port>/s//5000/" /home/ubuntu/socketLoader/config/writeSocket.cfg
export data="\/mnt\/data"
sed -i "0,/<datapath>/s//$data/" /home/ubuntu/socketLoader/config/writeSocket.cfg
