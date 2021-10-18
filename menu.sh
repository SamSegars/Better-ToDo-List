#!/bin/bash
Continue=y
Confirmno (){
  if test "$Confirm" != "y" -a "$Confirm" != "Y" ; then
    if test "$Confirm" = "n" -o "$Confirm" = "N" -o "$Confirm" = "" ; then
          echo "Canceled"
    else
          echo "Invalid Answer"
    fi
  fi
}
remove-task (){
  read -p "What task # would you like to remove?" Task
  FullTask=$(sed -n "$Task"p ~/.todo/.list)
  if test "$Task" = "" ; then
    echo "No Input recorded, Exiting..."
  fi
  if test "$Task" != "" ; then
    read -p "Are you sure you want to remove $Task. $FullTask? [y,N]" Confirm
    if test "$Confirm" = "y" -o "$Confirm" = "Y" ; then
    sed -i ""$Task"d" ~/.todo/.list
    echo "Removed $Task. $FullTask from task list"
    fi
    Confirmno
  fi
}
add-task(){
  if [ ! -d ~/.todo ]; then
    mkdir ~/.todo
    touch ~/.todo/.list
  fi
  read -p "What task would you like to add?" Task
  if test "$Task" = "" ; then
    echo "No Input recorded, Exiting..."
  fi
if test "$Task" != "" ; then
  echo "$Task" >> ~/.todo/.list
  NTask=$(cat -n ~/.todo/.list | tail -n 1)
  echo ""$NTask" Succesfully added"
fi
    }
list-task (){
    list=~/.todo/.list
    (:)
    linecount=$(cat $list | wc -l )
    if test $linecount -ge $LINES ; then
      cat -n "$list" | less
    else
      cat -n "$list"
    fi
    }
 duplicate(){
   read -p "Which task # would you like to duplicate?" Task
   FullTask=$(sed -n "$Task"p ~/.todo/.list)
   if test "$Task" = "" ; then
     echo "No Input recorded, Exiting...."
   fi
if test "$Task" != "" ; then
     read -p "Are you sure you want to duplicate $Task. $FullTask? [y,N]" Confirm
     if test "$Confirm" = "y" -o "$Confirm" = "Y" ; then
       echo $FullTask >> ~/.todo/.list
       NTask=$(cat -n ~/.todo/.list |tail -n 1)
       echo "Created "$NTask""
     fi
     Confirmno
fi
 }
while test "$Continue" = "y" ; do
read -p "         1. Add
         2. List
         3. Remove
         4. Duplicate
         5. Exit
Which Function would you like to use? " Choice
if test $Choice = 1 ; then
  echo "Add Selected"
  add-task
fi
if test $Choice = 2; then
  echo "List Selected"
  list-task
fi
if test $Choice = 3; then
  echo "Remove Selected"
  remove-task
fi
if test $Choice = 4; then
  echo "Duplicate Selected"
  duplicate
fi
if test $Choice != 1 -a $Choice != 2 -a $Choice != 3 -a $Choice != 4 ; then
  if test $Choice = 5; then
    echo "Exit Selected"
    exit
  else
    echo "Invalid Answer, Exiting..."
  fi
fi
read -p "Would you like to continue? [y,N]" Continue
done
