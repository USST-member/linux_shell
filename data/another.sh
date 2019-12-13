#!/bin/bash
mkdir ninja
ALL=`find -name "*.ninja"`;
oldIFS=$IFS
  IFS=$'\n'
a=0;
for item in $ALL;
do
        let a++;
        cp $item ./ninja/$a.ninja
done;
IFS=$oldIFS
cat ./ninja/*.ninja > 1.txt
rm -rf ./ninja

grep -F "<" 1.txt  > 2.txt

rm 1.txt

sed -e '/.png/d' 2.txt > 21.txt

rm 2.txt

sed -e '/.xml/d' 21.txt > 22.txt

rm 21.txt

sed -e '/.jpg/d' 22.txt > 23.txt

rm 22.txt
