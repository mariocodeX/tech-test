#!/bin/bash

read -p "Masukkan username: " uName
read -p "Masukkan IP address: " ipAddr
#ssh $uName@$ipAddr echo ok 2>&1
status=$(ssh $uName@$ipAddr echo ok 2>&1)

if [ $status==ok ]; then
	echo "Koneksi berhasil"
#elif [ $status== "Permission denied"* ]; then
#	echo "Koneksi gagal, permission denied"
else
	echo "Koneksi gagal"
fi
