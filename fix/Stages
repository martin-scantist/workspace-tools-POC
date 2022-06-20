#!/bin/bash

# run poc to test vulnerable env
cd ~/javascript/poc
node poc.js

# check the presence of evilfile
FILE=~/javascript/poc/evilfile
if [ -f "$FILE" ]; then
    echo "$FILE exists."
    echo "deleting evilfile and replacing git.js and running node poc.js"
    rm ~/javascript/poc/evilfile

    # replace lines in git.js
    cd ~/javascript/node_modules/workspace-tools/lib
    # sed -i 's/search_string/replace_string/' filename
    # fix both lines of code in git.js
    sed -i 's/git(\[\"fetch\",\ remote/git(\[\"fetch\",\ \"--\",\ remote/g' git.js

    # run poc again
    cd ~/javascript/poc
    node poc.js
    if [ -f "$FILE" ]; then
        echo "POC fail."
    else 
        echo "POC success!!!."
    fi
else 
    echo "$FILE does not exist."
fi
