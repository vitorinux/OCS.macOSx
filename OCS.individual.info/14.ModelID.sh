#!/bin/bash
system_profiler SPHardwareDataType | grep "Model Id" | cut -d : -f2 | sed 's/^ *//'
