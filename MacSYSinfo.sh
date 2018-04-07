#!/bin/bash

# Manufacturer (GenuineIntel)
sysctl -a | grep -i vendor | cut -d: -f2 | head -1 | sed 's/^ *//'

# TYPE (Core2Duo...)
sysctl -a | grep -i brand | cut -d: -f2 | head -1 | tr -d '[:blank:]'

# UUID Hardware
system_profiler SPHardwareDataType | grep UUID | cut -d : -f2 | sed 's/^ *//'

# Velocidad del Procesador
system_profiler SPHardwareDataType | grep "Processor Speed" | cut -d : -f2 | sed 's/^ *//'

# CPU Cores
sysctl -a | grep machdep.cpu.core_count | cut -d: -f2 | sed 's/^ *//'

# Tamaño Cache L2
system_profiler SPHardwareDataType | grep -E "Cache" | cut -d : -f2 | sed 's/^ *//'

# Arquitectura
uname -m

# CPU data width
sysctl -a | grep machdep.cpu.arch_perf.width | cut -d: -f2 | sed 's/^ *//'

# CPU Logicas
sysctl -a | grep machdep.cpu.thread_count | cut -d: -f2 | sed 's/^ *//'

#### Nivel de Bateria o Voltage 
# SYSTEM PROFILER Power Data Type Wattage (Descomentar para MacBook Series)
# system_profiler -detailLevel full SPPowerDataType | grep Wattage
# ioreg -l | grep LegacyBatteryInfo | cut -d '{' -f 2 | tr -d \} | tr ',' '=' | awk -F'=' '{print ($2*$10/10^22)}'
# Requiere de DMIDECODE, por el momento NO UTILIZABLE
# dmidecode 2>&1 | grep Voltage | cut -d: -f2 | head -1 | sed 's/^ *//'
##### Tipo de Socket, requiere DMIDECODE
#dmidecode 2>&1| grep "Socket Designation:" | cut -d: -f2 | sed 's/^ *//' | awk 'FNR == 1 {print $1}'

# Velocidad del Bus
system_profiler SPHardwareDataType | grep Bus | cut -d : -f2 | sed 's/^ *//'

# Modelo MAC ID
system_profiler SPHardwareDataType | grep "Model Id" | cut -d : -f2 | sed 's/^ *//'

# Modelo MAC Name (comercial)
system_profiler SPHardwareDataType | grep "Model Name" | cut -d : -f2 | sed 's/^ *//'

# Version de la ROM
system_profiler SPHardwareDataType | grep ROM | cut -d : -f2 | sed 's/^ *//'

# Numero de Serie
system_profiler SPHardwareDataType | grep Serial | cut -d : -f2 | sed 's/^ *//'

# Version de SMC
system_profiler SPHardwareDataType | grep SMC | cut -d : -f2 | sed 's/^ *//'
