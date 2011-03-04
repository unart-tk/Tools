#!/bin/bash 

#---
# Excerpted from "Cocoa Programming",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/shcloj for more book information.
#---
CLOJ=/usr/local/clojure/lib
CLP=$CLOJ/jline-0.9.94.jar:$CLOJ/clojure.jar:$CLOJ/clojure-contrib.jar:$CLOJ/ant.jar:$CLOJ/ant-launcher.jar:$CLOJ/compojure.jar:$CLOJ/hsqldb.jar:$CLOJ/jetty-6.1.14.jar:$CLOJ/jetty-util-6.1.14.jar:$CLOJ/servlet-api-2.5-6.1.14.jar:classes

if [ -z "$1" ]; then 
	 java -cp $CLP jline.ConsoleRunner clojure.lang.Repl
else
	java -cp $CLP clojure.lang.Script $1 -- $*
fi
