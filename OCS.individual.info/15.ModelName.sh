#!/bin/bash
system_profiler SPHardwareDataType | grep "Model Name" | cut -d : -f2 | sed 's/^ *//'
