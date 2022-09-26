#!/bin/sh


BASEDIR="/etc"
COUNTER="/etc/count.txt"
LINES=$(wc -l < /etc/count.txt)


ls -A $BASEDIR > newfiles
DIRDIFF=$(diff "/etc/oldfiles" newfiles)
if [ -z "$DIRDIFF" ];
then 
echo "No new files"
echo "X" >> $COUNTER
else
for file in $DIRDIFF
do 
if [ -e $BASEDIR/$file ]
then 
echo $file
cp newfiles /etc/oldfiles
> /etc/count.txt
fi 
done
fi

NEWLINES=$(wc -l < /etc/count.txt)

echo $NEWLINES


if [[ $NEWLINES -lt 4 ]];
then
echo "We cool...for now"
elif [ $NEWLINES -ge 4 ] && [ $NEWLINES -lt 10 ];
then
echo "Getting a little nervous now!"
elif [[ $NEWLINES -ge 10 ]];
then
echo "Shit's hit the fan!"
fi
