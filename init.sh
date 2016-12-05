#!/bin/bash
set -e
for f in *.sh
do

	 if [[ "$f" != "init.sh" ]] ; then
		echo "Create $f"
		chmod +x $f
		echo "alias ${f%%.*}=\"~/git-all-scripts/$f"\"
		alias ${f%%.*}=~/git-all-scripts/$f
	fi
done