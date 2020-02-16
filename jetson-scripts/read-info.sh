#!/bin/bash

echo "TEMP: " $(cat /sys/devices/virtual/thermal/thermal_zone*/temp)
echo "RPM:  " $(cat /sys/devices/pwm-fan/rpm_measured)
echo "TRPM: " $(cat /sys/devices/pwm-fan/target_pwm)
