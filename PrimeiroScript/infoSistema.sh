#!/bin/bash

clear
echo "Infos do seu sistema"
echo "----------------------"
echo -n "Usuário: "
whoami

echo -n "Hostname: "
hostname

echo -n "Uptime: "
uptime -p

echo -n "Kernel: "
uname -rms

echo "----------------------"
