#!/bin/sh
CLASSPATH=compojure.jar
COMPOJURE_HOME=$HOME/usr/local/compojure
 
for f in $COMPOJURE_HOME/deps/*.jar; do
    CLASSPATH=$CLASSPATH:$f
done
 
java -cp $CLASSPATH clojure.lang.Script $1

#or, for Windows:

#@echo off
#SETLOCAL enabledelayedexpansion
 
#FOR %%F IN (deps/*.jar) DO (
#  SET cp=!cp!;deps/%%F%
#)
 
#java -cp "compojure.jar;%cp%" clojure.lang.Repl %1%
