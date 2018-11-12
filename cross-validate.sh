#!/bin/bash

count=0
sciper=0
curr=0
while IFS='' read -r line || [[ -n "$line" ]]; do
    if [ $count -eq 0 ]; then
        sciper=${line:7:6}
    elif [ "${line:0:6}" == "######" ]; then
        if [ $count -ne 1 ]; then
            /Applications/SageMath/sage test3-$curr.py $param
        fi
        echo ${line:7:19}
        param="$sciper"
        curr=${line:16:1}
    elif [ "${line:2:3}" == " = " ]; then
        param="$param ${line:5}"
    elif [ "${line:2:1}" == "=" ]; then
        param="$param ${line:3}"
    else
        echo "$line"
    fi
    ((count++))
done < "parameters.txt";
/Applications/SageMath/sage test3-$curr.py $param

