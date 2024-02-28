#!/bin/bash
source_dir="/home/rakesh/assessment1/files"
destination_dir="/home/rakesh/assessment1/imp_file"
mkdir -p "$destination_dir/textfiles"
mkdir -p "$destination_dir/csvfiles"
mkdir -p "$destination_dir/Zipfile"
current_date=$(date +"%d-%m-%y")
fifteen_days_ago=$(date -d "15 days ago" +"%d-%m-%y" )
find "$source_dir" \( -name "*.txt" -o -name "*.csv" -o -name "*.zip" \) -type f -mtime -15 | head -n 30 | while read -r file; do
	file_extention="${file##*.}"
	case "$file_extention" in
		txt)
			file_type="textfile"
			;;
		csv)
			file_type="csvfile"
			;;
		zip)
			file_type="zipfile"
			;;
	esac


	modification_date=$(date -r "$file" +"%d-%m-%Y")

	mkdir -p "$destination_dir/$file_type/$modification_date"

    # Move the file to the appropriate subdirectory
	mv "$file" "$destination_dir/$file_type/$modification_date/"
	echo "Moved $file to $destination_dir/$file_type/$modification_date/ "
done



