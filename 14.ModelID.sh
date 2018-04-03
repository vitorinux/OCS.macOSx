#!/bin/bash
system_profiler SPHardwareDataType | grep Model\ ID | cut -d : -f2 | sed 's/^ *//'
