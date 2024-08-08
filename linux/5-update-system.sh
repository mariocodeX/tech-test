#!/bin/bash
## masih perlu perbaikan
logFile="./log_update1.log"

# informasi yang dicatat di dalam file
log() {
	echo "$(date +"%Y-%m-%d %H:%M:%S") - $1" >> $logFile
}

log "Meng-update package list..."
sudo apt update

log "Meng-upgrade semua paket..."
sudo apt full-upgrade -y
#upgradeOutput=$(sudo apt upgrade -y 2>$1)

#if [ $upgradeOutput := *"0 upgraded"* ]; then
#  log "Tidak ada paket yang di-upgrade"
#else
#  # Ekstrak nama paket yang diupgrade dari output
#  upgradedPackages=$(echo "$upgradeOutput" | grep "Upgraded:" | cut -d: -f2-)
#  log "Paket yang berhasil diupgrade:"
#  echo "$upgradedPackages" | while read -r package; do
#    log "$package"
#  done
#fi


log "Update dan upgrade selesai."
echo "-------------------------------------------------" >> $logFile
