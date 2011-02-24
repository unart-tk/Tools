startaptana () {
	export GDK_NATIVE_WINDOWS=1; /opt/aptana/aptanastudio 
}

starteclipse () {
	export GDK_NATIVE_WINDOWS=1; `/usr/local/eclipse3.5/eclipse --launcher.XXMaxPermSize 256m -vmargs -Xms256m -Xmx1024m -XX:PermSize=64m -Xss1M -server -XX:+DoEscapeAnalysis -XX:+UseConcMarkSweepGC &> /dev/null` &
}
