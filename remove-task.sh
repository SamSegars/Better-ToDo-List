#!/bin/bash 

ConfirmNo(){
  if test "$Confirm" = n -o "$Confirm" = N -o "$Confirm" = "" ; then
        echo "Canceled"
        exit
  else
        echo "Invalid Answer"
        exit
  fi
}

read -p "What task # would you like to remove?" Task
cat ~/.todo/.list | grep "^$Task[.]" > ~/.todo/.rmcheck
check1=$(cat ~/.todo/.rmcheck | head -n 1)
check2=$(cat ~/.todo/.rmcheck | tail -n 1)

if test "$check1" = "" ; then
  echo "Task $Task does not exist"
  exit 1
fi

if test "$check1" != "$check2" ; then

    read -p "Multiple tasks found
             1. $check1
             2. $check2
             Which would you like to remove? [1,2]" checkans
      if test $checkans = 1 -o $checkans = 2 ; then
            if test "$checkans" = 1 ; then
             read -p "Are you sure you want to remove $check1? [y,N]" Confirm
              if test "$Confirm" = y -o "$Confirm" = Y ; then
               sed -i "/"^$check1"/d" ~/.todo/.list
               echo "Removed $check1 from task list"
               exit
              fi
             ConfirmNo
            fi

            if test $checkans = 2 ; then
             read -p "Are you sure you want to remove $check2? [y,N]" Confirm
              if test "$Confirm" = y -o "$Confirm" = Y ; then
                sed -i "/"^$check2"/d" ~/.todo/.list
                echo "Removed $check2 from task list"
                exit
              fi
            ConfirmNo
            fi
      else
        echo "Invalid Answer"
        exit
     fi



else
  read -p "Are you sure you want to remove $check1? [y,N]" Confirm
  if test "$Confirm" = y -o "$Confirm" = Y ; then
  sed -i "/"^$check1"/d" ~/.todo/.list
  echo "Removed $check1 from task list"
  fi
  ConfirmNo
  exit
fi
