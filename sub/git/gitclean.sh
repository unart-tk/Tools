#!/bin/sh

# this evil and uninformed - don't use it. It deletes removed files, who wasn't removed with 'git rm'. Maybe it also does other stuff.


log='gitcommit.log'
rm -f $log
touch $log

git commit > $log


grep '#\s*deleted' $log | sed 's/#\s*deleted:\s*//g' | xargs -I F -- git rm F 
