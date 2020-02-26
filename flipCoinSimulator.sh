#!/bin/nash -x

#This problem displays winning percentage of Head or Tail Combination in a Sing$
#CONSTANTS
IS_HEAD=0
IS_TAILS=1
plays=0
#VARIABLES
declare -A singleCoin
randomNumber=0
singleCoin[H]=0
singleCoin[T]=0

printf "Enter How many times you want to flip the coin:\n"
read plays

for (( index=1; index<=$plays; index++ ))
do
	randomNumber=$(( RANDOM % 2 ))
   if [ $randomNumber -eq $IS_HEAD ]
      then
         singleCoin[H]=$(( "${singleCoin[H]}" + 1 ))
      else
         singleCoin[T]=$(( "${singleCoin[T]}" + 1 ))
fi
done

echo  ${singleCoin[@]}

head=`expr "scale=3; ( ${singleCoin[H]} / $plays ) * 100" | bc -l`
tails=`expr "scale=3; ( ${singleCoin[T]} / $plays ) * 100" | bc -l`

printf "head percentage: $head \ntails percantage: $tails \n"

