#!/bin/bash
#dmidecode | grep ID | cut -d : -f2 | head -1 | sed 's/^ *//'
system_profiler SPHardwareDataType | grep UUID | cut -d : -f2 | sed 's/^ *//'
