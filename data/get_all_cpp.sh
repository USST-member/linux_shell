#!/bin/bash
ALL_CPPNAME=`find "./" -name "*.cpp"`
CURRENT_PATH=`pwd`
SH_PATH_="/DATA1/sa6155p-la-1-0_hlos_dev/LINUX/android/out"
SH="/DATA1/sa6155p-la-1-0_hlos_dev/LINUX/android/out/search_cpp.sh"
count=0
if [ "$ALL_CPPNAME" != "" ]; then
  oldIFS=$IFS
  IFS=$'\n'
  string1='.cpp'
  for item in $ALL_CPPNAME;
  do
	result=$(echo $item | grep -F "${string1}");
	if [ "$result" != "" ]
	then
		#echo "*******************************************" ;
		#echo the cpp file path: $item
		#length=${#item};
	        #let sublength=$length-2
        	#subitem=${item:0:$sublength};
		subitem=${item:0-30:30};
		let count++;
		#echo "$subitem" ;
		#"$SH" /DATA1/sa6155p-la-1-0_hlos_dev/LINUX/android/out  "$subitem";
		echo $subitem;
		#echo $count;
		#echo "*******************************************";

	fi
  done; 
IFS=$oldIFS
fi
