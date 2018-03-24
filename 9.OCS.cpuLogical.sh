sysctl -a | grep machdep.cpu.thread_count | cut -d: -f2 | sed 's/^ *//'
