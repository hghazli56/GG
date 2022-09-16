#!bin/bash

# For this to work we need to run: echo ls -A > oldfiles and store the files in the directory before the script

function check_new_files {
BASEDIR=$(pwd)
ls -A $BASEDIR > newfiles
DIRDIFF=$(diff oldfiles newfiles | cut -f 2)
for file in $DIRDIFF
do
if [ -e $BASEDIR/$file ]; then
echo $file
fi
done
ls -A $BASEDIR > oldfiles
}

check_new_files


