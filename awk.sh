#!/bin/bash

awkFile=awk.txt

# NR 是行号，引用变量方式：'$变量' $数字 打印每行分割后的第几个字符
# $1 打印第一个 $0 打印一行，exit退出，也就是只满足一次条件
# -F 分隔符，默认空格
# 正则搜索 /正则表达式/
key=abc
readResult=$(awk -F , '/'$key'/ && NR>2 {print $2,NR }' $awkFile)
echo $readResult
readResult=$(awk '{print $0; exit }' $awkFile)
echo $readResult
# 从管道接受文本
readResult=$(cat $awkFile | awk '{print $1 }')
echo $readResult
