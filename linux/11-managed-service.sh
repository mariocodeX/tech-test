#!/bin/bash
function show_menu() {
  echo "Pengelolaan Service"
  echo "Pilihan:"
  echo "1. Start"
  echo "2. Stop"
  echo "3. Status"
  echo ""

  read -p "Masukkan pilihan Anda (1-3): " options
  echo
  return $options
}

function get_service_name() {
  read -p "Ketikkan nama service yang akan Anda $1: " service_name
  echo $service_name
}

# Fungsi utama
main() {
  show_menu
  option=$?

  if [ "$option" -eq 1 ]; then
    service_name=$(get_service_name "Start")
    sudo systemctl start "$service_name"
    echo "Service $service_name sudah aktif"
  elif [ "$option" -eq 2 ]; then
    service_name=$(get_service_name "Stop")
    sudo systemctl stop "$service_name"
    echo "Service $service_name sudah berhenti"
  elif [ "$option" -eq 3 ]; then
    service_name=$(get_service_name "cek Statusnya")
    sudo systemctl status "$service_name"
  else
    echo "Pilihan tidak valid."
  fi
}

# Panggil fungsi utama
main
