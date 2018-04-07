#!/bin/bash
#sysctl -a | grep machdep.cpu.tlb.data.large_level1: | cut -d: -f2 | sed 's/^ *//'
sysctl -a | grep machdep.cpu.arch_perf.width | cut -d: -f2 | sed 's/^ *//'
