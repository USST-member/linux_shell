#!/bin/bash
#ALL_CPPNAME=`find "./" -name "*.cpp"`
CURRENT_PATH=`pwd`
#SH_PATH_=`/DATA1/sa6155p-la-1-0_hlos_dev/LINUX/android/out/`
SH="/DATA1/sa6155p-la-1-0_hlos_dev/LINUX/android/out/search_cpp.sh"
conut=`$2`
  string1='.cpp'
  while read line
  do
	result=$(echo $line | grep -F "${string1}");
	if [ "$result" != "" ]
	then
		echo "*******************************************" ;
		echo the cpp file path: $line
		#length=${#item};
	        #let sublength=$length-2
        	#subitem=${item:0:$sublength};
		#subitem=${line:0-30:30};
		let count++;
		#echo "$subitem" ;
			#echo "***********************************************************************";
			echo "the file name:$line";
#NINJA_PATH=`find "/DATA1/sa6155p-la-1-0_hlos_dev/LINUX/android/out" -type f -name '*.ninja'|xargs grep -nrF "$subitem"`
			NINJA_PATH=`grep "$line" -nF  "all_files.txt"`;
			if [ "$NINJA_PATH" != "" ]; then
			  oldIFS=$IFS
			  IFS="="
			  SUM1=0
			  string11="<"
			  i1=0
			  for item1 in $NINJA_PATH;
			  do
				let SUM1++;
				result=$(echo $item1 | grep -F "${string11}");
				if [ "$result" != "" ]
				then
					let i1++;
					echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++";
					echo "$item1";
					echo "--------------------------------------------------------------";
				fi
			  done;
			IFS=$oldIFS
			echo "the "$subitem" file has been compiled $i1 module";
			fi
			echo "                                                                                                     ";
			echo "                                                                                                     ";
		#echo $subitem;
		echo $count;
		#echo "*******************************************";
fi
  done < $1; 
