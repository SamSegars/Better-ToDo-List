#!/bin/bash 
directory=~/.todo
number=$directory/.number
list=$directory/.list
if [ ! -d "$directory" ]; then
  mkdir $directory
  touch $number
  echo "0" > $number
  touch $list
fi

read -p "What task would you like to add?" Task

ON=$(cat $number)
NN=$(($ON + 1))
echo $NN > $number

echo "$NN.$Task" >> $list
echo "$NN.$Task Succesfully added"
