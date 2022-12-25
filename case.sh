#!/bin/bash

start() {
  echo start...
}

stop() {
  echo stop...
}

case $1 in
start)
  start
  ;;
stop)
  stop
  ;;
*)
  echo "Usage: {start|stop}"
  ;;
esac
