#!/bin/bash
set -e
for file in */ .*/ ; do
    if [ -d $file.git ]; then
    	echo ''
    	echo "$(tput setaf 3)--- $file ---$(tput sgr0)"
        cd $file
       git commit -m "$1"
       cd ../
    fi
done