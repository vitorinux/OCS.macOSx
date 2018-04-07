#!/bin/bash
system_profiler SPHardwareDataType | grep Serial | cut -d : -f2 | sed 's/^ *//'
