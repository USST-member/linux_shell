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
