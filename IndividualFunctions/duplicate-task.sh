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

read -p "Which task # would you like to duplicate?" Task
FullTask=$(sed -n "$Task"p ~/.todo/.list)

if test "$Task" = "" ; then
  echo "No Input recorded, Exiting...."
  exit 1
fi

  read -p "Are you sure you want to duplicate $Task. $FullTask? [y,N]" Confirm
  if test "$Confirm" = y -o "$Confirm" = Y ; then
  echo $FullTask >> ~/.todo/.list
  NTask=$(cat -n ~/.todo/.list |tail -n 1)
  echo "Created "$NTask""
  exit
  fi
  ConfirmNo
  exit
