#!/bin/bash
echo "Meng-copy public key ke target host"
#read -p "Masukkan direktori file public key: " keyDir
while true; do
    read -p "Masukkan direktori file public key: " keyDir
    if [[ $keyDir =~ \.pub$ ]]; then
        break
    else
        echo "Nama file harus berekstensi .pub. Silakan coba lagi."
	#exit 1
    fi
done

read -p "Masukkan username host tujuan: " uName
read -p "Masukkan IP address host tujuan: " ipAddr
ssh-copy-id -f $keyDir $uName@$ipAddr

echo "Public key berhasil di-copy."
