#!/bin/bash
file="$HOME/.ssh/authorized_keys"
read -p "Masukkan string yang unik dari key public: " uniqueStr
read -p "Masukkan username yang bersangkutan: " uName

tmpfile=$(mktemp)

#grep -E "$uniqueStr.*$uName|$uName.*$uniqueStr" "$file" -v > "$tmpfile"
#grep -v "$uniqueStr|$uName" "$file" > "$tmpfile"
grep -vE ".*$uniqueStr.*$uName|$uName.*$uniqueStr.*" "$file" > "$tmpfile"

mv "$tmpfile" "$file"

echo "Baris yang mengandung keyword '$uniqueStr' dari username '$uName' telah dihapus dari authorized_keys"
