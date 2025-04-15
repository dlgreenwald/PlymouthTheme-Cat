#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit 1
fi

DURATION=$1
if [ $# -ne 1 ]
 then DURATION=2
fi

plymouthd
plymouth --show-splash
plymouth change-mode --boot-up
sleep $DURATION
plymouth ask-for-password --prompt="Please enter password"
sleep $DURATION;
plymouth update --status="nice big long string"
sleep $DURATION;
plymouth --quit
