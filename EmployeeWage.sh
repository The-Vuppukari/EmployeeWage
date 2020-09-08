#!/bin/bash -x

isPresent=1
empCheck=$(( RANDOM % 2 ))
empWage=20
if [ $isPresent -eq $empCheck ]
then
	echo " The employee is present "
	empHrs=8
else
	echo " The employee is absent "
	empHrs=0
fi
empSalary=$(( $empWage * $empHrs ))
