#!/usr/bin/env sh
deepls(){
for x in "$1/"*
do 
#echo $x
if [ -f $x ]
then
echo $x $I|cut -d '/' -f5-8 >> $NAME
fi
if [ -d $x ]
then
(deepls "$x")
I=`expr $I + 1`
fi
done
}
I=0
DEST_PATH="/media/goods/data_new/data_use/dbsf"
NAME="/media/goods/data_new/data_use/dbsf/dbsf.txt"
deepls $DEST_PATH


