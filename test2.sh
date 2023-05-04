#!/bin/bash

echo "Запущен тест 2-го скрипта"

file_test1=test1_file
file_test2=test2_file

touch $file_test1
touch $file_test2

echo "Иванов" >> $file_test1
echo "Петров" >> $file_test1
echo "Сидоров" >> $file_test1

echo "Телегин" >> $file_test2
echo "Мамаев" >> $file_test2
echo "Комаров" >> $file_test2

# тест 1
result=$(./script2.sh $file_test1 $file_test2)
expected="Повторов не найдено"

if [[ $result == $expected ]]
then
    echo "Тест 1 пройден"
else
    echo "Тест 1 не пройден"
    rm $file_test1 $file_test2
    exit 1
fi

# тест 2
echo "Мамаев" >> $file_test2

result=$(./script2.sh $file_test1 $file_test2)
expected="В группе 2 есть одинаковые фамилии"

if [[ $result == $expected ]]
then
    echo "Тест 2 пройден"
else
    echo "Тест 2 не пройден"
    rm $file_test1 $file_test2
    exit 1
fi

rm $file_test1 $file_test2