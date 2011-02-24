## Apache Aliases and Oneliners
## ============================
## 
##     (c) 2011 Ben, untar.org
##


isapacherunning () {
	local ap=apache2
	ps -eaf | grep "$ap" | grep -v grep
}

