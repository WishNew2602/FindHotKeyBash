#! /bin/bash

echo "Starting to look for Hot word  "

read -p " Enter hot keyword to search for " word

rm -R ./HotFiles
mkdir ./HotFiles
rm ./output.txt
touch ./output.txt

chmod +rwx ./output.txt ./HotFiles


for myFile in ./test_files/*;
do
	if [ -f "${myFile}" ]; then
		check=$(grep -ni "$word" "${myFile}")
		if [ ! -z "${check}" ]; then
			#echo " Found ${word}"
			echo "${myFile}" "${check}" >> output.txt
			cp "${myFile}" ./HotFiles	
			echo "                           " >> "./HotFiles/$(basename "${myFile}")"
			echo " ***********************" >> "./HotFiles/$(basename "${myFile}")"
			echo "${check}" >> "./HotFiles/$(basename "${myFile}")"
			
		else
			echo "This file does not contain the word : ${word}"
		fi
	else
		echo " This is not a file : "${myFile}""
	fi
	
	echo "---------------------------------------------------"

done