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

./get_all_cpp.sh > cpp.txt

split -l 4000 cpp.txt -d -a 1 url_
cat url_6 | tail -n +2600 | head -n 1400 > url_10
cat url_6 | tail -n +1 | head -n 2600 > url_11
mv url_11 url_6

rm cpp.txt

for ((i=0; i<=10; i ++))
do
{
	./test.sh url_$i  > $i.dong
}&
done



