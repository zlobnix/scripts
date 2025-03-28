#!/bin/bash
myOS=`uname -a`
echo  "Hello your system is: $myOS";

echo  "нулевая переменная $0";

myhost=`hostname`

echo $myhost
ping -c 4 $myhost
