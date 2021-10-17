#!/bin/bash 
list=~/.todo/.list
(:)
linecount=$(cat $list | wc -l )
if test $linecount -ge $LINES ; then
  cat "$list" | less
else
  cat "$list"
fi
