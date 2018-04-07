#!/bin/bash
system_profiler SPHardwareDataType | grep ROM | cut -d : -f2 | sed 's/^ *//'
