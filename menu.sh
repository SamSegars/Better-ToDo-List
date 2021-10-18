#!/bin/bash
#Gives a list of all other functions to choose from
ConfirmNo (){
if test "$Confirm" = n -o "$Confirm" = N -o "$Confirm" = "" ; then
      echo "Canceled"
      exit
else
      echo "Invalid Answer"
      exit
fi
}
remove-task (){
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

}
add-task(){
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
 }
clear
read -p "         1. Add
         2. List
         3. Remove
         4. Duplicate 
         5. Exit
Which Function would you like to use? " Choice
if test $Choice = 1 ; then
  echo "Add Selected"
  add-task
  exit
fi
if test $Choice = 2; then
  echo "List Selected"
  list-task
  exit
fi
if test $Choice = 3; then
  echo "Remove Selected"
  remove-task
  exit
fi
if test $Choice = 4; then
  echo "Duplicate Selected"
  duplicate
  exit
fi
if test $Choice = 5; then
  echo "Exit Selected"
  exit
else
  echo "Invalid Answer
        Exiting..."
fi
