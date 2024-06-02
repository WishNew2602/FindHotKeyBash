#! /bin/bash
echo " we are going to find Hot word in all the Data files inside in Test_Files directory "
read -p " Enter the work yoou want to search for : " hotWord

rm -rf ./HotFiles
mkdir ./HotFiles
rm -f noHotKeyWord.txt
touch noHotKeyWord.txt

for fol in $(find ./test_files/ -type d);
do
	echo "***************************************************************************************************************"
	echo "${fol}"
	
	for myFile in ${fol}/* ;
	do
		if [ -f "${myFile}" ]; then
			check=$(grep -ni "${hotWord}" "${myFile}")
			if [ ! -z "${check}" ]; then
				echo ${myFile}
				cp "${myFile}" ./HotFiles
				echo "                                                                        " >> "./HotFiles/$(basename "${myFile}")"
				echo "***********************************************************************************************************************************************" >> "./HotFiles/$(basename "${myFile}")"
				echo "${check}" >> "./HotFiles/$(basename "${myFile}")"
				
			else
				echo ${myFile}
				echo "no keyword inside "${myFile}" " >> noHotKeyWord.txt
			fi
		fi
	done
	echo "*****************************************************************************************************************"
done