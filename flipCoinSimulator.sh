#!/bin/nash -x

#This problem displays winning percentage of Head or Tail Combination in a Sing$
#CONSTANTS
IS_HEAD=0
IS_TAILS=1

#VARIABLES
randomNumber=0

#GENRATE RANDOM NUMBER
randomNumber=$(( RANDOM % 2 ))
if [ $randomNumber -eq $IS_HEAD ]
   then
      printf "HEAD\n"
   else
      printf "TAILS\n"
fi

