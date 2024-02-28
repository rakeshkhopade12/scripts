#!/bin/bash
folder_path="/home/rakesh/test"
target_user="rakesh"


find "$folder_path" -type f -user "$target_user" -atime -3 |
while read -r file; do
	echo "oringinal_filename: $file"
	new_filename=$(echo "$file" | tr '[:upper:]' '[:lower:]' | tr -d '[:space:]')

	mv "$file" "$new_filename"

	echo "modified filename: $new_filename"
	echo ""
done
