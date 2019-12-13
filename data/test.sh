			#!/bin/bash
			for line in $(cat $1)
			do
			echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>";
			NINJA_PATH=`grep "${line}" -nF  "2.txt"`;
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
			echo "the "${line}" file has been compiled $i1 module";
			fi
			echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<";
			echo "                                                                            ";
			echo "                                                                            ";
			done
