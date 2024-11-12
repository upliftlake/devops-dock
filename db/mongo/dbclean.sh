cd /backhere

#space used
usedSpace=`df -h / | sed -n 2p | awk '{print $5}' | cut -c -2`


if [[ $(($usedSpace)) -eq 98 ]]
then
	#sort the files according to time and take the first one
	filesToRemove=`ls -tr | head -1 | cut -c -11`
        echo $filesToRemove
        rm $filesToRemove*
fi
