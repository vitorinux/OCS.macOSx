#!/bin/bash
system_profiler SPHardwareDataType | grep "Processor Speed" | cut -d : -f2 | sed 's/^ *//'
