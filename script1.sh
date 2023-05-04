#!/bin/bash

if [[ ! -n $1 ]] || [[ ! -n $2 ]]
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

count1=$(cat $file1 | grep -c '')
count2=$(cat $file2 | grep -c '')

if [[ $count1 -eq $count2 ]]
then
    echo "Количество студентов в группах совпадает: $count1"
else
    echo "Количество студентов в группах не совпадает!"
    echo "Группа 1: $count1 чел."
    echo "Группа 2: $count2 чел."
fi