#!/bin/bash
set -x

inputFile=$1
outputFile=${PWD}/$(date +%m%d)_new_$1
arch=
rpmName=


if [ -f $outputFile ]; then
    rm $outputFile
fi

touch $outputFile
dos2unix $inputFile

while read LINE
do
    rpmName=${LINE%%-[0-9]*}
    arch="`echo ${LINE} | awk -F "." '{print $NF}'`"
    echo $rpmName.$arch >> $outputFile
done < $inputFile
sort $outputFile -o $outputFile
