#!/bin/bash

#install saltstack and join the master

curl -L https://bootstrap.saltstack.com -o install_salt.sh
sudo sh install_salt.sh -P 
cd /etc/salt
sed -i "681s/.*/master_finger: '29:5c:a3:67:d7:6f:56:84:cd:90:da:f3:c8:51:54:14:3d:8f:eb:2d:df:bf:ca:26:83:88:6e:fc:df:c1:b4:7f'/" minion
sed -i '17s/.*/master: 10.2.3.16/' minion

