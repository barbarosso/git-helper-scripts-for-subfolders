#!/bin/bash
set -e
for file in */ .*/ ; do
    if [ -d $file.git ]; then
    	echo ''
    	echo "$(tput setaf 3)--- $file ---$(tput sgr0)"
       cd $file
       git flow feature start $1
       sed '/git@github.com:Moovly/s/.git#.*/\.git#feature\\\/'$1'\",/' <package.json >tmp.json
       mv tmp.json package.json
       cd ../
    fi
done
git-add-all
git-commit-all "init feature"
git-flow-feature-publish-all $1