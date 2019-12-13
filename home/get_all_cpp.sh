#!/bin/bash
FILE="~/search_log.txt"
ALL_CPPNAME=`find "./" -name "*.cpp"`
CURRENT_PATH=`pwd`
SH_PATH_="/DATA1/sa6155p-la-1-0_hlos_dev/LINUX/android/out"
SH="/DATA1/sa6155p-la-1-0_hlos_dev/LINUX/android/out/search_cpp.sh"
if [ "$ALL_CPPNAME" != "" ]; then
  oldIFS=$IFS
  IFS="/"
  string1=".cpp"
  for item in $ALL_CPPNAME;
  do
	result=$(echo $item | grep "${string1}");
	if [ "$result" != "" ]
	then
		#echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" ;
		length=${#item};
	        let sublength=$length-2
        	subitem=${item:0:$sublength};
		echo "$subitem" ;
		#"$SH" ./  "$subitem";
		echo "                                          ";

	fi
  done;
IFS=$oldIFS
fi
