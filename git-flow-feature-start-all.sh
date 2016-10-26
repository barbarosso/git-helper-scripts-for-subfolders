#!/bin/bash
set -e
for file in */ .*/ ; do
    if [ -d $file.git ]; then
		echo ''
		echo "$(tput setaf 3)--- $file ---$(tput sgr0)"
		cd $file
		git flow feature start $1
		if [ -f "package.json" ]
		then
			sed '/moovly-/s/.git#.*/\.git#feature\\\/'$1'\",/' <package.json >tmp.json
			mv tmp.json package.json
		fi
		git add -A
		git commit -m "init feature - version edit"
		git flow feature publish $1
		cd ../
    fi
done