#!/bin/bash
#namaFolder=backup-$(date "+%d-%m-%Y")
namaFile=backup-$(date "+%d-%m-%Y_%H.%M.%S")
#namaFile=backup-$(date +"%Y-%m-%d %H:%M:%S")

# src and dest directory
echo "Backup data"
read -p "Source directory: " srcDir
read -p "Destination directory: " destDir

archiveName="$destDir/$namaFile"

# backup ke direktori tertentu
sudo rsync -a $srcDir $destDir

# kompres file dengan nama file $namaFile dan disimpan ke direktori $destDir
sudo tar -czf $archiveName.tar.gz $srcDir

echo "Backup success"
