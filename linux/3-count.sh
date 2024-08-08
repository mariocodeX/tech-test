#!/bin/bash

# Request Input direktori
read -p "Masukkan direktori: " dir

# Fungsi untuk membuat header tabel
function print_header {
  printf "+------------------------------------------------+\n"
  printf "| %-18s | %5s | %5s | %9s |\n" "File" "Baris" "Kata" "Karakter"
  printf "+------------------------------------------------+\n"
}

# Fungsi untuk menampilkan data dalam bentuk tabel
function print_row {
  printf "| %-18s | %5d | %5d | %9d |\n" "$1" "$2" "$3" "$4"
}

# Fungsi untuk membuat footer tabel
function print_footer {
  printf "+------------------------------------------------+\n"
}

# Periksa apakah dir ada
if [ -d "$dir" ]; then
  print_header
  # Loop melalui setiap file dalam dir
  for file in "$dir"/*; do
    if [ -f "$file" ] && [[ "$file" =~ \.txt$ ]]; then
      # Hitung baris, kata, dan karakter
      baris=$(wc -l < "$file")
      kata=$(wc -w < "$file")
      karakter=$(wc -m < "$file")

      # Tampilkan data dalam format tabel
      print_row "$file" "$baris" "$kata" "$karakter"
    fi
  done
  # Tampilkan footer tabel
  print_footer
else
  echo "Direktori '$dir' tidak ditemukan."
fi
