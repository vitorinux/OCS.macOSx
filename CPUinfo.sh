#!/bin/bash
system_profiler SPHardwareDataType | grep UUID | cut -d : -f2 | sed 's/^ *//'
