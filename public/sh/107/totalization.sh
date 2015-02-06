#!/bin/bash

wget http://www.ep.sci.hokudai.ac.jp/~inex/y2014/0425/practical/kadaidata/homeworktype4.tar.gz

tar zxvf homeworktype4.tar.gz

rm homeworktype4.tar.gz


mkdir sadamaru fuukachan gunkanchan shimaneko invalid

cd ./homeworktype4

n=1
gun=1
shi=1
sad=1
fuu=1
inv=1


while test ${n} -ne 10 ; do

if [ `cat vote00${n}` = 'GUNKANCHAN' ] ; then mv vote00${n} gunkanchan${gun}
mv gunkanchan${gun} /home/inoue/kadai/gunkanchan
gun=`expr ${gun} + 1`

elif [ `cat vote00${n}` = 'FUUKACHAN' ] ; then mv vote00${n} fuukachan${fuu}
mv fuukachan${fuu} /home/inoue/kadai/fuukachan
fuu=`expr ${fuu} + 1`

elif [ `cat vote00${n}` = 'SADAMARU' ] ; then mv vote00${n} sadamaru${sad}
mv sadamaru${sad} /home/inoue/kadai/sadamaru
sad=`expr ${sad} + 1`

elif [ `cat vote00${n}` = 'SHIMANEKO' ] ; then mv vote00${n} shimaneko${shi}
mv shimaneko${shi} /home/inoue/kadai/shimaneko
shi=`expr ${shi} + 1`

else sed -e 's/$/ CHECKED/g' vote00${n} > invalid${inv}
mv invalid${inv} /home/inoue/kadai/invalid
rm vote00${n}
inv=`expr ${inv} + 1`

fi
n=`expr ${n} + 1`

done

while test ${n} -ne 100 ; do

if [ `cat vote0${n}` = 'GUNKANCHAN' ] ; then mv vote0${n} gunkanchan${gun}
mv gunkanchan${gun} /home/inoue/kadai/gunkanchan
gun=`expr ${gun} + 1`

elif [ `cat vote0${n}` = 'FUUKACHAN' ] ; then mv vote0${n} fuukachan${fuu}
mv fuukachan${fuu} /home/inoue/kadai/fuukachan
fuu=`expr ${fuu} + 1`

elif [ `cat vote0${n}` = 'SADAMARU' ] ; then mv vote0${n} sadamaru${sad}
mv sadamaru${sad} /home/inoue/kadai/sadamaru
sad=`expr ${sad} + 1`

elif [ `cat vote0${n}` = 'SHIMANEKO' ] ; then mv vote0${n} shimaneko${shi}
mv shimaneko${shi} /home/inoue/kadai/shimaneko
shi=`expr ${shi} + 1`

else sed -e 's/$/ CHECKED/g' vote0${n} > invalid${inv}
mv invalid${inv} /home/inoue/kadai/invalid
rm vote0${n}
inv=`expr ${inv} + 1`

fi
n=`expr ${n} + 1`

done

if [ `cat vote100` = 'GUNKANCHAN' ] ; then mv vote100 gunkanchan${gun}
mv gunkanchan${gun} /home/inoue/kadai/gunkanchan
gun=`expr ${gun} + 1`

elif [ `cat vote100` = 'FUUKACHAN' ] ; then mv vote100 fuukachan${fuu}
mv fuukachan${fuu} /home/inoue/kadai/fuukachan
fuu=`expr ${fuu} + 1`

elif [ `cat vote100` = 'SADAMARU' ] ; then mv vote100 sadamaru${sad}
mv sadamaru${sad} /home/inoue/kadai/sadamaru
sad=`expr ${sad} + 1`

elif [ `cat vote100` = 'SHIMANEKO' ] ; then mv vote100 shimaneko${shi}
mv shimaneko${shi} /home/inoue/kadai/shimaneko
shi=`expr ${shi} + 1`

else sed -e 's/$/ CHECKED/g' vote100 > invalid${inv}
mv invalid${inv} /home/inoue/kadai/invalid
rm vote100
inv=`expr ${inv} + 1`

fi

echo GUNKANCHAN `expr ${gun} - 1` >  result_file.txt
echo FUUKACHAN `expr ${fuu} - 1` >> result_file.txt
echo SADAMARU `expr ${sad} - 1` >> result_file.txt
echo SHIMANEKO `expr ${shi} - 1` >> result_file.txt
echo INVALID `expr ${inv} - 1` >> result_file.txt
mv result_file.txt /home/inoue/kadai
