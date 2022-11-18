#!/bin/bash

start=$1
end=$2

if [ -z $start ]; then
  start=0
fi

if [ -z $end ]; then
  end=10
fi

# 自定义for区间
for i in $(seq $start $end); do
  echo $i
done
