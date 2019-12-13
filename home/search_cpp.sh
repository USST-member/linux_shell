#!/bin/bash
echo "the shell name:$0            search path:$1            the file name:$2"
#################################################################################################################
########  first search all the cpp name in the .mk file ,.mk file convert to .bp file , output name in the .bp  #
########  second search all the cpp name in the .bp file ,output the name in ths .bp                            #
#################################################################################################################
NINJA_PATH=`find "$1" -type f -name '*.ninja'|xargs grep -nr "$2"`
CURRENT_PATH=`pwd`

if [ "$NINJA_PATH" != "" ]; then

 # echo ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^;
  #echo "the cpp filename appera in these file:$NINJA_PATH"
  #echo ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^;
  oldIFS=$IFS
  IFS="="
  SUM=0
  string1="<"
  i=0
  for item in $NINJA_PATH;
  do
    let SUM++;
	result=$(echo $item | grep "${string1}");
	if [ "$result" != "" ]
	then
		#echo $SUM
		let i++;
		echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++;
   		echo $item;
  		echo --------------------------------------------------------------;
	fi
  done;
IFS=$oldIFS
echo the "$2" file has been compiled $i module;
fi
