#!/bin/bash
echo "Enter directory (Enter . for current directory):"
read dir

echo "Listing all files in the directory:"$dir
echo "This list is sorted by size (ascending)"
echo "Folders and subdirectories are excluded"
echo "Include size?"
PS3="#)?"
select option in yes no; do
	case $option in
		yes)
			find "$dir" -maxdepth 1 -type f -exec ls -lShr {} + | awk '{print "\n",$5,"\t",$9}'
			break;;
		no)
			echo
			ls "$dir" -apShr | grep -v /
			break;;
		*)
			echo "Invalid input. Type 1/2.";;
	esac

done
