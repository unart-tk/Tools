# Bash Aliases
#      ____________________________
#  
#      Copyright (C) 2010 Ben Leak
#  
#      v0.1, 2010-10-22, <leakin.org>
#      bash / aliases
#      ____________________________
#

# show  the most used tools
hitparade () {
 hist=$(history)
 echo "$hist" | awk '{print $2}' | awk 'BEGIN {FS="|"}{print $1}' | sort | uniq -c | sort -n | tail | sort -nr

}
