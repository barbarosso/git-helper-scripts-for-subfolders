#!/bin/bash
set -e
for file in */ .*/ ; do
    if [ -d $file.git ] && [ "$file" != "moovly-prototype/" ]; then
		echo ''
		echo "$(tput setaf 3)--- $file ---$(tput sgr0)"
		cd $file
		git flow feature start $1
		if [ -f "package.json" ]; then
			sed '/git@github.com:Moovly/s/.git#.*/\.git#feature\\\/'$1'\",/' <package.json >tmp.json
			mv tmp.json package.json
			if [ -z "$(git status --porcelain)" ]; then
				echo 'Nothing to commit.'
			else
				echo 'Commit package change.'
				git add -A
				git commit -m "init-feature"
			fi
		fi
		echo 'Publish feature...'
		git flow feature publish $1
		cd ../
    fi
done