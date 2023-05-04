#!/bin/bash


if [[ ! -n $1 || ! -n $2 ]]
then
    echo "Аргументы не найдены"
    exit 0
fi

file1=$1
file2=$2

if [[ ! -f $file1 ]] || [[ ! -f $file2 ]]
then
    echo "Файлы не существуют"
    exit 0
fi

flag_group1=0
flag_group2=0

# проверка на повторы в 1-ом файле
for line in $(cat $file1)
do
    count=0
    for second_line in $(cat $file1)
    do
        if [[ $line == $second_line ]]
        then
            count=$((count+1))
        fi

        if [[ $count -gt 1 ]]
        then
            flag_group1=1
            break
        fi
    done
done

# проверка на повторы в 2-ом файле
for line in $(cat $file2)
do
    count=0
    for second_line in $(cat $file2)
    do
        if [[ $line == $second_line ]]
        then
            count=$((count+1))
        fi

        if [[ $count -gt 1 ]]
        then
            flag_group2=1
            break
        fi
    done
done

if [[ $flag_group1 -gt 0 || $flag_group2 -gt 0 ]]
then
    if [[ $flag_group1 -gt 0 ]]
    then
        echo "В группе 1 есть одинаковые фамилии"
    fi
    if [[ $flag_group2 -gt 0 ]]
    then
        echo "В группе 2 есть одинаковые фамилии"
    fi
else
    echo "Повторов не найдено"
fi