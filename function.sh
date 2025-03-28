#!/bin/bash

sum=0

myfunction()
{
	echo "This is text from function!"
	echo "First parametr is: $1"
	echo "Second param is : $2"
	sum=$(($1+$2))
}

myfunction 50 10

echo "Summa = $sum"
