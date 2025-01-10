#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit 1
fi

DURATION=$1
if [ $# -ne 1 ]
 then DURATION=5
fi

plymouthd
plymouth --show-splash
sleep $DURATION;
plymouth --quit
