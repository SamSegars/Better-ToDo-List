#!/bin/bash

read -p "What task # would you like to remove?" Task
cat ~/.todo/.list | grep "^$Task[.]" > ~/.todo/.rmcheck
check1=$(cat ~/.todo/.rmcheck | head -n 1)
check2=$(cat ~/.todo/.rmcheck | tail -n 1)

if test "$check1" != "$check2" ; then

    read -p "Multiple tasks found
             1. $check1
             2. $check2
             Which would you like to remove? [1,2]" checkans

           if test $checkans = 1 ; then
           sed -i "/$check1/d" ~/.todo/.list
           echo "Removed $check1 from task list"
           exit
           fi

           if test $checkans = 2 ; then
           sed -i "/$check2/d" ~/.todo/.list
           echo "Removed $check2 from task list"
           exit
           fi

else
  sed -i "/$check1/d" ~/.todo/.list
  echo "Removed $check1 from task list"
  exit
fi
