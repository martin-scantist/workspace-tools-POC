#!/bin/bash

FILE=~/javascript/poc/evilfile
if [ -f "$FILE" ]; then
    echo "$FILE exists."
    echo "deleting evilfile and replacing git.js and running node poc.js"
    rm ~/javascript/poc/evilfile
    # replace lines in git.js
    cd ~/javascript/node_modules/workspace-tools/lib
    # sed -i 's/search_string/replace_string/' filename
    # fix both lines of code
    sed -i 's/git(\[\"fetch\",\ remote/git(\[\"fetch\",\ \"--\",\ remote/g' git.js

    # replace vulnerable file
    # cp git.js ~/javascript/node_modules/workspace-tools/lib

    # run poc again
    cd ~/javascript/poc
    node poc.js
else 
    echo "$FILE does not exist."
fi




