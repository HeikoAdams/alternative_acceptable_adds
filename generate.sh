#! /bin/bash
clear
CURRENTPATH=`realpath $0`
CURRENT=`dirname $CURRENTPATH`
TIMESTAMP=$(date)

if [ -e $CURRENT/rules/exceptionrules.txt ]
then
	/usr/bin/rm -f $CURRENT/rules/exceptionrules.txt
fi

if [ -N $CURRENT/data/misc.dat ] || [ -N $CURRENT/data/blogs.dat ] || [ -N $CURRENT/data/news.dat ] || [ -N $CURRENT/data/socialmedia.dat ]
then
	echo "Generating exceptionrules.txt ..."
	echo -e "[Adblock Plus 2.0]\n! Expires: 1 days" > $CURRENT/rules/exceptionrules.txt
	echo -e "! Last update: $TIMESTAMP" >> $CURRENT/rules/exceptionrules.txt
	echo -e "! Misc stuff\n" >> $CURRENT/rules/exceptionrules.txt
	cat $CURRENT/data/misc.dat >> $CURRENT/rules/exceptionrules.txt
	echo -e "\n! Blogs\n" >> $CURRENT/rules/exceptionrules.txt
	cat $CURRENT/data/blogs.dat >> $CURRENT/rules/exceptionrules.txt
	echo -e "\n! News\n" >> $CURRENT/rules/exceptionrules.txt
	cat $CURRENT/data/news.dat >> $CURRENT/rules/exceptionrules.txt
	
	if [ -N $CURRENT/data/socialmedia.dat ]
	then
		if [ -e $CURRENT/rules/social.txt ]
		then
			/usr/bin/rm -f $CURRENT/rules/social.txt
		fi
	
		echo -e "[Adblock Plus 2.0]\n! Expires: 1 days" > $CURRENT/rules/social.txt
		echo -e "! Last update: $TIMESTAMP" >> $CURRENT/rules/social.txt
		cat $CURRENT/data/socialmedia.dat >> $CURRENT/rules/social.txt
		echo -e "\n" >> $CURRENT/rules/social.txt
	fi
	
	echo -e "\n" >> $CURRENT/rules/exceptionrules.txt
	echo "Generating completed!"

	if [ ! -e $CURRENT/upload.sh ]
	then
		echo -e "\nNo upload.sh found. Uploading to ftp canceled!"
		echo -e "You can use the upload.sh.dist file as a template"
		echo -e "for creating your own upload.sh upload script."
	else
		echo -e "\nUploading exceptionrules.txt to remote host"
		$CURRENT/upload.sh
	fi
else
	echo "Nothing to do!"
fi
