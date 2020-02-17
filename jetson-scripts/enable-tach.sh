#!/bin/bash

if [[ ${EUID} -ne 0 ]]; then
    echo "Error: script needs to be executed as root"
    exit -1
fi

echo 1 > /sys/devices/pwm-fan/tach_enable
