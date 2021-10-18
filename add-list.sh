#!/bin/bash
directory=~/.todo
list=$directory/.list
if [ ! -d "$directory" ]; then
  mkdir $directory
  touch $list
fi

read -p "What task would you like to add?" Task

echo "$Task" >> $list
NTask=$(cat -n ~/.todo/.list | tail -n 1)
echo ""$NTask" Succesfully added"
