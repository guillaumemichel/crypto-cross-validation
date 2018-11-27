#!/bin/bash

pathtosage="/Applications/SageMath/sage"
pathtoparameters="parameters.txt"
filename="test4-"

count=0
sciper=0
curr=0
while IFS='' read -r line || [[ -n "$line" ]]; do
    if [ $count -eq 0 ]; then
        # set the sciper number as it is the value at the first line
        sciper=${line:7:6}

    elif [ "${line:0:6}" == "######" ]; then
        # if "######" then new exercise => new parameters
        if [ $count -ne 1 ]; then
            # sage test4-1.py args
            eval '$pathtosage' '$filename$curr.py' $param
        fi
        # echo Exercise 1
        echo ${line:7:19}
        # first parameter is always the sciper (even if it is not useful for the exercise)
        param="$sciper"
        # set the exercise number to curr
        curr=${line:16:1}


    elif [[ $line == *"="* ]]; then
        # if the line contains '=', we add the parameter to the parameter's list
        str=$(echo "$line"| cut -d'=' -f2-)
        if [ "${str:0:1}" == " " ]; then
            # if there is a space after the =, we truncate it
            str=${str:1}
        fi
        if [ "${str:0:1}" == "\"" ]; then
            # if the parameter is a "string": str = "12 34"
            str="\"$(echo "$str"| cut -d'"' -f2)\""
        elif [ "${str:0:1}" == "'" ]; then
            # if the parameter is a 'string': str = '12 34'
            str="'$(echo "$str"| cut -d"'" -f2)'"
        elif [ "${str:0:1}" == "(" ]; then
            # if the parameter is a tuple: str = "(1, 2, 3)"
            str="\"$str\""
        elif [ "${str:0:1}" == "[" ]; then
            # if the parameter is an array: str = "[(1, 2), (3,4)]"
            str="\"$str\""
        fi
        # add the parameter to the list
        param="$param $str"

    else
        # don't know how to handle the line => print it
        echo "$line"

    fi
    ((count++))
done < $pathtoparameters
# evaluate the last exercise
eval '$pathtosage' '$filename$curr.py' $param

