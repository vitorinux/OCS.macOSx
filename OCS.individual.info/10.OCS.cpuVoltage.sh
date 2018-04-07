#!/bin/bash
## Uncomment for MacBook series
## SYSTEM PROFILER Power Data Type Wattage
#system_profiler -detailLevel full SPPowerDataType | grep Wattage
#ioreg -l | grep LegacyBatteryInfo | cut -d '{' -f 2 | tr -d \} | tr ',' '=' | awk -F'=' '{print ($2*$10/10^22)}'
## Depends of BREW PACKAGE and DMIDECODE package
dmidecode 2>&1 | grep Voltage | cut -d: -f2 | head -1 | sed 's/^ *//'
