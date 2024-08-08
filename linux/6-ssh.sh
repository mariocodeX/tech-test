#!/bin/bash
echo "Membuat ssh-key"
read -p "Masukkan lokasi penyimpanan key: " destDir

if [ -d "$destDir" ]; then
  echo "Key akan disimpan ke $destDir ."
else
  # Jika folder belum ada, buat folder utama dan subfolder
  mkdir -p $destDir
  echo "Folder $destDir berhasil dibuat."
  echo "Key akan disimpan ke $destDir ."
fi

ssh-keygen -t rsa -b 4096 -f "$destDir/key" 

echo "ssh-key berhasil dibuat"
