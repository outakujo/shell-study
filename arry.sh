#!/bin/bash

# 定义数组
arr=()
# 添加元素，arr[索引]=值
arr[0]=3
arr[1]=5
# 数组长度
aln=${#arr[@]}
echo len:"$aln"
# 变量数组
for ((i = 0; i < aln; i++)); do
  # 获取数组中的值
  va=${arr[i]}
  echo $va
done
