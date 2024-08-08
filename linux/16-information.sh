#!/bin/bash
echo "Informasi Dasar Sistem"
hostname=$(hostname)
currentTime=$(date)
currentUser=$(whoami)
numOfLoginUsers=$(who | wc -l)
cpuModel=$(cat /proc/cpuinfo | grep "model name" | uniq | cut -d: -f2)
arch=$(uname -m)
cpuNumber=$(nproc)
osVersion=$(cat /etc/os-release | grep "PRETTY_NAME" | cut -d'=' -f2 | sed 's/"//g')

echo "Nama Host			 : " $hostname
echo "User Anda			 : " $currentUser
echo "Waktu Sistem		         : " $currentTime
echo "Jumlah Pengguna yang Login 	 : " $numOfLoginUsers
echo "Model CPU			 : " $cpuModel
echo "Arsitektur		 	 : " $arch
echo "Jumlah CPU		 	 : " $cpuNumber
echo "Versi OS			 : " $osVersion

