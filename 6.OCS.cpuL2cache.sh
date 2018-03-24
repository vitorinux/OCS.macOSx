#!/bin/bash
export CACHEL2=`sysctl -a | grep hw.l2cachesize | cut -d: -f2 | sed 's/^ *//'`
#echo $CACHEL2
echo $CACHEL2/1024 | bc
