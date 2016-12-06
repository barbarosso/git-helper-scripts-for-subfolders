#!/bin/bash
set -e
for file in */ .*/ ; do
	if [ -d $file.git ] && [ "$file" != "moovly-prototype/" ]; then
		echo ''
		echo "$(tput setaf 3)--- $file ---$(tput sgr0)"
		cd $file
		git checkout $1
		cd ..
	fi
done