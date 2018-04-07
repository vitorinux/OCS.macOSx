#!/bin/bash
system_profiler SPHardwareDataType | grep Bus | cut -d : -f2 | sed 's/^ *//'
