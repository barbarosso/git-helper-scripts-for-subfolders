#!/bin/bash
set -e
for f in *.sh
do

	 if [[ "$f" != "init.sh" ]] ; then
		#echo "Create $f"
		mkdir -p ~/git-all-scripts/ 
		cp $f ~/git-all-scripts/
		chmod +x ~/git-all-scripts/$f
		echo "alias ${f%%.*}=\"~/git-all-scripts/$f"\"
		alias ${f%%.*}=~/git-all-scripts/$f
	fi
done