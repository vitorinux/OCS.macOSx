#!/bin/bash
export SPEED=`sysctl -a | grep hw.cpufrequency: | cut -d: -f2 | sed 's/^ *//'`
#echo $SPEED
## 10^9 to convert from Hz to GHz
## x1000000 to convert from Hz to MHz
#echo $SPEED/10^9 | bc
echo $SPEED/1000000 | bc
