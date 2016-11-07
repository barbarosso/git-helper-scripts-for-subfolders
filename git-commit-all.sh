#!/bin/bash
set -e
for file in */ .*/ ; do
    if [ -d $file.git ]; then
    	echo ''
    	echo "$(tput setaf 3)--- $file ---$(tput sgr0)"
        cd $file
        if [ -z "$(git status --porcelain)" ]; then
				echo 'Nothing to commit.'
		else
			git add -A
       		git commit -m "$1"
		fi
    	cd ../
    fi
done