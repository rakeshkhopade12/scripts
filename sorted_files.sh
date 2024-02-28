#!/bin/bash
set -x
folder_path="/home/rakesh/assessment1/"

find "$folder_path" -maxdepth 1 -type f ! -name "*.exe" |
while read -r file; do
	file_extention="${dile##*.}"


	if [ "$file_extension" = "xlsx" ]; then
		csv_filename="${file%.*}.csv"
		echo "converting $file to $csv_filename"

		xlsx2csv "$file" > "$csv_filename"
		rm "$file"
	elif [ "$file_extension" = "csv" ]; then
		current_date=$(date +"%y-%m%d")
		new_filename="${file%.*}_${current_date}.${file_extension}"

		echo "renaming $file to $new_filename"
		mv "$file" "$new_filename"
	else
		echo "$file"
	fi
done
