#!/bin/bash
echo "the shell name:$0            search path:$1            the file name:$2"
#################################################################################################################
########  first search all the cpp name in the .mk file ,.mk file convert to .bp file , output name in the .bp  #
########  second search all the cpp name in the .bp file ,output the name in ths .bp                            #
#################################################################################################################
MK_PATH=`find "$1" -type f -name '*.mk'|xargs grep -l "$2"`
CURRENT_PATH=`pwd`

if [ "$MK_PATH" != "" ]; then

  echo ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^;
  echo "the cpp filename appera in these file:$MK_PATH"
  echo ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^;
  oldIFS=$IFS
  IFS=.
  SUM=0
  i=0
  for item in $MK_PATH;
  do
    let SUM++;
    b=$(( $SUM % 2 ))
    if [ $b = 0 ];
    then
	let i++;
	#echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++;
   	#echo $item;
  	#echo --------------------------------------------------------------;


	mkdir "$i";
	cp .$item.mk  ./$i;
	cd ./$i;

	filename=`ls`;
	length=${#filename};
	let sublength=$length-3
	subfilename=${filename:0:$sublength};
	echo $subfilename;
	cp ../androidmk ./
	./androidmk $subfilename.mk > $i.bp
	output=`grep --color=auto -nR "name"`
	echo $output
	cd ..
	rm -rf $i
    fi
  done;
IFS=$oldIFS
fi
###################second: search bp file#############################
BP_PATH=`find "$1" -type f -name '*.bp'|xargs grep -l "$2"`
if [ "$BP_PATH" != "" ]; then

  echo ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^;
  echo "the cpp filename appera in these file:$BP_PATH"
  echo ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^;
  oldIFS=$IFS
  IFS=.
  SUM=0
  for item in $BP_PATH;
    do
    let SUM++;
    b=$(( $SUM % 2 ))
    if [ $b = 0 ];then
        let i++;
        #echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++;
        #echo $item;
        #echo --------------------------------------------------------------;


        mkdir "$i";
        cp .$item.bp  ./$i;
        cd ./$i;

        filename=`ls`;
        length=${#filename};
        let sublength=$length-3
        subfilename=${filename:0:$sublength};
	echo $subfilename;
        output=`grep --color=auto -nR "name"`
        echo $output
        cd ..
        rm -rf $i
     fi
   done;
IFS=$oldIFS
fi
echo the cpp filename appear in $i module

