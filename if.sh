#!/bin/bash

demo() {
  local a=$1
  # 判断变量a是空则执行if里
  if [ ! "$a" ]; then
    echo return 1
    return 1
  fi
  echo return 0
  return 0
}

demo "$1"

# ./if.sh aa 输出 return 0
# ./if.sh 输出 return 1
