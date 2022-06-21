#!/bin/bash
# run poc to test vulnerable env
echo "*** Starting POC"
cd "/home/tester/javascript/poc"
node poc.js
# check the presence of evilfile
FILE=/home/tester/javascript/poc/evilfile
if [ -f "$FILE" ]; then
    echo "*** $FILE exists."
    echo "*** deleting evilfile and replacing git.js and running node poc.js"
    rm /home/tester/javascript/poc/evilfile

    # replace lines in git.js
    cd /home/tester/javascript/node_modules/workspace-tools/lib
    # sed -i 's/search_string/replace_string/' filename
    # fix both lines of code in git.js
    sed -i 's/git(\[\"fetch\",\ remote/git(\[\"fetch\",\ \"--\",\ remote/g' git.js

    # run poc again
    cd /home/tester/javascript/poc
    node poc.js
    if [ -f "$FILE" ]; then
        echo "*** POC fail."
    else
        echo "*** POC success!!!."
    fi
else
    echo "*** $FILE does not exist."
fi
echo "*** End of POC"
# build npm package on local and upload to code artifact
# cd /home/tester/javascript/node_modules/workspace-tools/
# npm publish to AWS code artifact
# show manual patch and pipeline patch


# workspace-tools@0.16.2 commit 7fdc307c3fddd5fdb2e4a563c6a3552d99776a33
