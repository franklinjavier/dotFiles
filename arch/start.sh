#!/bin/bash

sudo wpa_supplicant -D wired -i eth0  -c /etc/wpa_supplicant.conf &
sudo dhclient eth0 

