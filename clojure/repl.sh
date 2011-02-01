#!/bin/sh
# copyright (c) 2010 ben@lekin.org
# ./repl.sh --help
	BREAK_CHARS="(){}[],^%$#@\"\";:''|\\"
	CLOJURE_DIR=/usr/local/clojure
	CLOJURE_JAR=$CLOJURE_DIR/clojure.jar
	CONTRIB_JAR=CLOJURE_DIR/clojure-contrib/clojure-contrib.jar
	if [ $# -eq 0 ]; then 
    	rlwrap --remember -c -b $BREAK_CHARS -f $HOME/.clj_completions \
    		java -cp $CLOJURE_JAR:$CONTRIB_JAR clojure.lang.Repl
		else
  	  java -cp $CLOJURE_JAR:$CONTRIB_JAR clojure.lang.Script $1 -- $@
	fi

 
