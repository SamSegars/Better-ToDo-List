#!/bin/bash -x
if [ ! -d ~/.todo ]; then
  mkdir ~/.todo
  touch ~/.todo/.list
fi

read -p "What task would you like to add?" Task

if test "$Task" = "" ; then
  echo "No Input recorded, Exiting..."
  exit 1
fi

echo "$Task" >> ~/.todo/.list
NTask=$(cat -n ~/.todo/.list | tail -n 1)
echo ""$NTask" Succesfully added"
