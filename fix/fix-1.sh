git clone git@github.com:microsoft/workspace-tools.git
git checkout workspace-tools_v0.16.2

export vulnerable_file="src/git.ts"

# fix
echo "fixing file"
sed -i 's/git(\[\"fetch\",\ remote/git(\[\"fetch\",\ \"--\",\ remote/g' $vulnerable_file

# build
echo "build package"

# upload
echo "upload package"
