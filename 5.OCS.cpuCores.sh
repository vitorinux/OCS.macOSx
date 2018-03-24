#!/bin/bash
sysctl -a | grep machdep.cpu.core_count | cut -d: -f2 | sed 's/^ *//'
