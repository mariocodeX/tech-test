#!/bin/bash
read -p "Masukkan direktori: " destDir
read -p "Masukkan ekstensi file: " extFile

find "$destDir" -type f -name "*.$extFile" -print
