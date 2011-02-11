#!/bin/sh
#
#  tree.sh - Displays Structure of Directory Hierarchy
#  
#	Copyright (c) 2010 Ben Leak
#  	v0.1: 2010-10-18, leakin.org/x/utils
#  	tags: utils | shell | filesystem
#

echo
if [ "$1" != "" ]  #if parameter exists, use as base folder
   then cd "$1"
fi
pwd
ls -R | grep ":$" |   \
   sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'
# 1st sed: remove colons
# 2nd sed: replace higher level folder names with dashes
# 3rd sed: indent graph three spaces
# 4th sed: replace first dash with a vertical bar
if [ `ls -F -1 | grep "/" | wc -l` = 0 ]   # check if no folders
   then echo "   -> no sub-directories"
   fi
echo
exit

# as oneliner
# ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/' 
