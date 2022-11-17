#!/bin/bash

demo() {
  local fn=$1
  # 判断文件是否存在
  if [ -f "$fn" ]; then
    # 追加写入文件
    echo "append" >>"$fn"
    return
  fi
  # 覆盖写入文件
  cat >"$fn" <<EOF
this line 1
this line 1
EOF
}

demo "$1"
