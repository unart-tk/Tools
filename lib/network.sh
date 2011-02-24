getinterf(){
	interf="$1"
	if [ ! $interf ];then
		echo "using default: eth0"
		interf="eth0"
		ifconfig $interf | grep inet | grep -v inet6 | cut -d ":" -f 2 | cut -d " " -f 1
	fi
}

