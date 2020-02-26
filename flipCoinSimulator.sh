#!/bin/nash -x

#This problem displays winning percentage of Head or Tail Combination in a Sing$
#CONSTANTS
IS_HEAD=0
IS_TAILS=1
plays=0
#VARIABLES
declare -A coin
randomNumber=0
randomNumber2=0
coin[HH]=0
coin[TT]=0
coin[HT]=0
coin[TH]=0
coin[T]=0
coin[H]=0

printf "Enter How many times you want to flip the coin:\n"
read plays

#SINGLE COIN FLIP
for (( index=1; index<=$plays; index++ ))
do
	randomNumber=$(( RANDOM % 2 ))

   if [ $randomNumber -eq $IS_HEAD ]
      then
         coin[H]=$(( "${coin[H]}" + 1 ))
      else
         coin[T]=$(( "${coin[T]}" + 1 ))
fi
done

#DOUBLE COIN FLIP

for (( index=1; index<=$plays; index++ ))
do
   randomNumber=$(( RANDOM % 2 ))
	randomNumber2=$(( RANDOM % 2 ))
   if [ $randomNumber -eq $IS_HEAD -a $randomNumber2 -eq $IS_HEAD ]
      then
         coin[HH]=$(( "${coin[HH]}" + 1 ))
      elif [ $randomNumber -eq $IS_HEAD -a $randomNumber2 -eq $IS_TAILS ]
      	then
				coin[HT]=$(( "${coin[HT]}" + 1 ))
			elif [ $randomNumber -eq $IS_TAILS -a $randomNumber2 -eq $IS_HEAD ]
				then
					coin[TH]=$(( "${coin[TH]}" + 1 ))
				elif [ $randomNumber -eq $IS_TAILS -a $randomNumber2 -eq $IS_TAILS ]
					then
						coin[TT]=$(( "${coin[TT]}" + 1 ))
	fi
done

echo ${coin[@]}
echo ${!coin[@]}
HH=`expr "scale=3; ( ${coin[HH]} / $plays ) * 100" | bc -l`
HT=`expr "scale=3; ( ${coin[HT]} / $plays ) * 100" | bc -l`
TT=`expr "scale=3; ( ${coin[TT]} / $plays ) * 100" | bc -l`
TH=`expr "scale=3; ( ${coin[TH]} / $plays ) * 100" | bc -l`
H=`expr "scale=3; ( ${coin[H]} / $plays ) * 100" | bc -l`
T=`expr "scale=3; ( ${coin[T]} / $plays ) * 100" | bc -l`
printf "H percentage: $H \nT percantage: $T \n"
printf "HH percentage: $HH \nHT percantage: $HT \nTT percentage: $TT\nTH percentage: $TH\n"


