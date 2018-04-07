#!/bin/bash
## 10^9 to convert from Hz to GHz
## x1000000 to convert from Hz to MHz
#echo $SPEED/1000000 | bc

get_cpu_speed() {
export SPEED=$[`sysctl -a | grep hw.cpufrequency: | cut -d: -f2 | sed 's/^ *//'` / 1000000]
}

get_cpu_speed

echo $SPEED
