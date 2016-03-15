#!/bin/bash

# Use the following line if you booted the machine with a static IP
sudo echo "127.0.0.1 ip-10-10-120-85" >>/etc/hosts
wget -O install_salt.sh https://bootstrap.saltstack.com
sudo sh install_salt.sh
sudo echo "file_client: local" >>/etc/salt/minion
sudo echo "local: True" >>/etc/salt/minion
sudo apt-get install -y git
sudo mkdir /srv/salt
git clone https://github.com/jolson7168/streamingserver.git /home/ubuntu/streamingserver
sudo cp -R /home/ubuntu/streamingserver/salt/* /srv/salt
sudo salt-call --local state.highstate
