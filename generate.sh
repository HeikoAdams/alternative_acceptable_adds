#! /bin/bash
echo -e "[Adblock Plus 2.0]\n! Expires: 1 days" > exceptionrules.txt
cat data/misc.dat >> exceptionrules.txt
cat data/blogs.dat >> exceptionrules.txt
cat data/news.dat >> exceptionrules.txt