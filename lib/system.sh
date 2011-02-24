alias xchmod='chmod u+x'

cleanbin (){
    if [ -n $1 ]; then dir=$1; else dir='.'; fi
    find $dir -type f \( -iname "*.cm*" -or -iname "*.omc" \) -exec rm -f {} +
}
# checkps - is process running
checkps (){
	local proc=$1
	ps -eaf | grep "$proc" | grep -v grep
}

proconport () { 
    lsof -w -n -i tcp:"$1" ; 
    }  


showps () {
    ps aux | grep "$1" | grep -v grep | awk '{ print $2}';
}

killps () {
    local procs=`ps aux | grep "$1" | awk '{ print $2}'`;
    if [ ! $procs ];then
        echo -e "No processes found ";
    else
        ps aux | grep "$1" | awk '{ print $2}' | xargs sudo kill ;
    fi
}
alias xchmod='chmod u+x'
# checkps - is process running
checkps (){
	local proc=$1
	ps -eaf | grep "$proc" | grep -v grep
}

proconport () { 
    lsof -w -n -i tcp:"$1" ; 
    }  


showps () {
    ps aux | grep "$1" | awk '{ print $2}';
}

killps () {
    local procs=`ps aux | grep "$1" | awk '{ print $2}'`;
    if [ ! $procs ];then
        echo -e "No processes found ";
    else
        ps aux | grep "$1" | awk '{ print $2}' | xargs sudo kill ;
    fi
}
#!/bin/bash
#
# kill process with name
#
killps () {
  local proc="$1"
	# proc="gcalctool" # DEBUG

  local procs=`ps aux | grep "$proc" | awk '{ print $2}'`;
	# echo "proc:" $proc	# DEBUG
	# echo "procs:" $procs	# DEBUG
  if [ ! $procs ];then
        echo -e "No processes found ";
  else
        ps aux | grep "$proc" | awk '{ print $2}' | xargs sudo kill ;
  fi
}
