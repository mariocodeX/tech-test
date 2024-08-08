#!/bin/bash
echo "Menyalin file dengan rsync"
read -p "Masukkan direktori source file: " sourceFile
read -p "Masukkan username server tujuan: " username
read -p "Masukkan IP Address server tujuan: " ipAddr

echo "Mohon tunggu, proses rsync sedang berjalan di background."

# melakukan sync ke folder $HOME
rsync -a $sourceFile $username@$ipAddr:~/

if [ $? -eq 0 ]; then
  echo "File berhasil disalin menggunakan rsync."
else
  echo "Terjadi kesalahan saat menyalin file menggunakan rsync."
fi
