#!/bin/bash
Continue=y

while test "$Continue" = "Y" -o "$Continue" = "y"; do
read -p "What task # would you like to remove?" Task
FullTask=$(sed -n "$Task"p ~/.todo/.list)

if test "$Task" = "" ; then
  echo "No Input recorded, Exiting..."
  exit 1
fi

  read -p "Are you sure you want to remove $Task. $FullTask? [y,N]" Confirm
  if test "$Confirm" = "y" -o "$Confirm" = "Y" ; then
  sed -i ""$Task"d" ~/.todo/.list
  echo "Removed $Task. $FullTask from task list"
  read -p "Do you want to continue? [y,N]" Continue
  fi

  if test "$Confirm" != "y" -a "$Confirm" != "Y" ; then
    if test "$Confirm" = "n" -o "$Confirm" = "N" -o "$Confirm" = "" ; then
          echo "Canceled"
          read -p "Do you want to continue? [y,N]" Continue
    else
          echo "Invalid Answer"
          read -p "Do you want to continue? [y,N]" Continue
    fi
  fi
done
