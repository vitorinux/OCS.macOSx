#!/bin/bash
sysctl -a | grep machdep.cpu.tlb.data.large_level1: | cut -d: -f2 | sed 's/^ *//'
