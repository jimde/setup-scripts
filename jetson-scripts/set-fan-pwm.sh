#!/bin/bash

if [[ ${EUID} -ne 0 ]]; then
    echo "Error: script needs to be executed as root"
    exit -1
fi

if [[ $# -ne 1 ]]; then
    echo "Error: missing argument <PWM>"
    exit -1
fi

if [[ ! ${1} =~ ^[0-9]+$ ]]; then
    echo "Error: input is not an integer"
    exit -1
fi

if [[ ${1} -gt 255 ]]; then
    echo "Error: input is greater than 255"
    exit -1
fi

if [[ ${1} -lt 0 ]]; then
    echo "Error: input is lesser than 0"
    exit -1
fi

echo ${1} > /sys/devices/pwm-fan/target_pwm
