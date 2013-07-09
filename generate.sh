#! /bin/bash
clear
CURRENT=`pwd`
echo "Generating exceptionrules.txt ..."
echo -e "[Adblock Plus 2.0]\n! Expires: 1 days" > $CURRENT/exceptionrules.txt
cat $CURRENT/data/misc.dat >> $CURRENT/exceptionrules.txt
cat $CURRENT/data/blogs.dat >> $CURRENT/exceptionrules.txt
cat $CURRENT/data/news.dat >> $CURRENT/exceptionrules.txt
echo "Generating completed!"

if ![ -e $CURRENT/upload.sh ]
then
	echo -e "\nNo upload.sh found. Uploading to ftp canceled!"
	echo -e "You can use the upload.sh.dist file as a template"
	echo -e "for creating your own upload.sh upload script."
else
	echo -e "\nUploading exceptionrules.txt to remote host"
	$CURRENT/upload.sh
fi