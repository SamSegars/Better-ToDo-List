#!/bin/bash
list=~/.todo/.list
(:)
linecount=$(cat $list | wc -l )
if test $linecount -ge $LINES ; then
  cat -n "$list" | less
else
  cat -n "$list"
fi
