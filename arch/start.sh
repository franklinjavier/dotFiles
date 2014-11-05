#!/bin/bash

sudo wpa_supplicant -D wired -i eno1 -c /etc/wpa_supplicant.conf &
sudo dhclient eno1

