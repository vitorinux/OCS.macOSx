#!/bin/bash
system_profiler SPHardwareDataType | grep -E "Cache" | cut -d : -f2 | sed 's/^ *//'
