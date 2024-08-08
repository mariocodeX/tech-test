#!/bin/bash
#read -p "Masukkan nama file public key dan ekstensinya: " keyDir
#read -p "Masukkan username yang berkaitan dengan key: " uName

# baca isi file

while true; do
	read -p "Masukkan nama file public key dan ekstensinya: " keyDir
	if [ ! -f $keyDir ]; then
		echo "File tidak ada."
		exit 1
	else
		if [[ $keyDir =~ \.pub$ ]]; then
			echo "Isi file akan di-copy."
			break
		else
			echo "Nama file harus berekstensi .pub. Silakan coba lagi."
		fi
	fi
done

#if [ -f $keyDir ]; then
#	echo "Isi file akan di-copy."
#else
#	echo "File tidak ada."
#	exit 1
	#touch $HOME/.ssh/authorized_keys
#fi

#cat $key

# direktori file auth_keys
authKeyDir="$HOME/.ssh/authorized_keys"

if [ -f $authKeyDir ]; then
        echo "File authorized_keys ada."
else
        echo "File authorized_keys tidak ada. File akan dibuat"
        touch $HOME/.ssh/authorized_keys
fi

# menulis isi file public key dari $keyDir ke file authorized_key baris berikutnya
cat $keyDir >> $authKeyDir
chmod 600 $authKeyDir #standar permission utk authorized_key

echo "Public key telah ditambah ke $authKeyDir"
