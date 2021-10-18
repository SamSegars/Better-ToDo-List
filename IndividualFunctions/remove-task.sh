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
FullTask=$(sed -n "$Task"p ~/.todo/.list)

if test "$Task" = "" ; then
  echo "No Input recorded, Exiting..."
  exit 1
fi

  read -p "Are you sure you want to remove $Task. $FullTask? [y,N]" Confirm
  if test "$Confirm" = y -o "$Confirm" = Y ; then
  sed -i ""$Task"d" ~/.todo/.list
  echo "Removed $Task. $FullTask from task list"
  exit
  fi
  ConfirmNo
  exit
