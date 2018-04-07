#!/bin/bash
system_profiler SPHardwareDataType | grep SMC | cut -d : -f2 | sed 's/^ *//'
