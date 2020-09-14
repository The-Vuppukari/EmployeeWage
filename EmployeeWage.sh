#!/bin/bash -x

isPartTime=1;
isFullTime=2;
maxHrsInMonth=100;
totalSalary=0;
empRatePerHr=20;
numWorkingDays=20;

totalEmpHrs=0;
totalWorkingDays=0;

function getWorkingHours(){
	case $1 in
      $isFullTime)
         workingHours=8
         ;;
      $isPartTime)
         workingHours=4
         ;;
      *)
         workingHours=0
         ;;
   esac
	echo $workingHours
}

function calcDailyWage(){
	local workingHours=$1
	wage=$(($workingHours*$empRatePerHr))
	echo $wage
}
while [[ $totalEmpHrs -lt $maxHrsInMonth && $totalWorkingDays -lt $numWorkingDays ]]

do
	((totalWorkingDays++))
	workingHours="$( getWorkingHours $(( RANDOM % 3 )) )"
	totalWorkHours=$(($totalWorkHours + $workingHours ));
	empDailyWage[$totalWorkingDays]="$( calcDailyWage $workingHours )"
done
totalSalary="$( calcDailyWage $totalWorkHours )";
echo " Daily Wage " ${empDailyWage[@]}
echo " Days " ${!empDailyWage[@]}
