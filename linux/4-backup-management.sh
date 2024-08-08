#!/bin/bash

# Simpan parameter ke dalam variabel
read -p "Masukkan direktori sumber: " srcDir
read -p "Masukkan direktori tujuan: " destDir

# Tanggal untuk nama folder
dateBackup=$(date +%Y-%m-%d_%H-%M-%S)

# Buat direktori tujuan backup jika belum ada
mkdir -p "$destDir/$dateBackup"

# Lakukan backup menggunakan rsync
rsync -av --delete "$drcDir/" "$destDir/$dateBackup/"

# Hapus backup yang lebih tua dari 7 hari
find "$destDir" -type d -mtime +7 -exec rm -rf {} \;
