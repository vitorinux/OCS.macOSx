#!/bin/bash

# 1.OCS Get Manufacturer
get_cpu_mnfct() {
	m=`sysctl -a | grep -i vendor | cut -d: -f2 | head -1 | sed 's/^ *//'`
	export MANUFACTURER=`echo $m`
}

# 2.OCS Get CPU Type, Model and Frecuency. Global data
get_cpu_type() {
	#t=`sysctl -a | grep -i brand | cut -d: -f2 | head -1 | tr -d '[:blank:]'`
	t=`sysctl -a | grep -i brand | cut -d: -f2 | head -1 `
	export TYPE=`echo $t`
}

# 3.OCS CPU Serial Number
get_cpu_id() {
	s=`system_profiler SPHardwareDataType | grep UUID | cut -d : -f2 | sed 's/^ *//'`
	export SERIALNUMBER=`echo $s`
}

# 4.OCS
get_cpu_speed() {
	sp=`system_profiler SPHardwareDataType | grep "Processor Speed" | cut -d : -f2 | sed 's/^ *//' | tr -d '[:blank:]'`
	export SPEED=`echo $sp`
}

# 5.OCS
get_cpu_cores() {
	cor=`sysctl -a | grep machdep.cpu.core_count | cut -d: -f2 | sed 's/^ *//'`
	export CORES=`echo $cor`
}

# 6.OCS
get_cpu_cachedos() {
	eledos=`system_profiler SPHardwareDataType | grep -E "Cache" | cut -d : -f2 | sed 's/^ *//' | tr -d '[:blank:]'`
	export L2CACHESIZE=`echo $eledos`
}

# 7.OCS
get_cpu_arch() {
	ar=`uname -m`
	export CPUARCH=`echo $ar`
}

# 8.OCS
get_cpu_data_width() {
	dw=`sysctl -a | grep machdep.cpu.tlb.data.large_level1: | cut -d: -f2 | sed 's/^ *//'`
	export DATA_WIDTH=`echo $dw`
}

# 9.OCS
get_cpu_current_addr_width() {
	dw=`sysctl -a | grep machdep.cpu.tlb.data.large_level1: | cut -d: -f2 | sed 's/^ *//'`
	export CURRENT_ADDRESS_WIDTH=`echo $dw`
}
# 10.OCS
get_cpu_logical() {
	log=`sysctl -a | grep machdep.cpu.thread_count | cut -d: -f2 | sed 's/^ *//'`
	export LOGICAL_CPUS=`echo $log`
}

# 11.OCS
get_cpu_volts() {
	v=`dmidecode 2>&1 | grep Voltage | cut -d: -f2 | head -1 | sed 's/^ *//'| tr -d '[:blank:]'`
	export VOLTAGE=`echo $v`
}

get_bus_speed() {
	b=`system_profiler SPHardwareDataType | grep Bus | cut -d : -f2 | sed 's/^ *//'| tr -d '[:blank:]'`
	export BUS_SPEED=`echo $b`
}

get_model_id() {
	mid=`system_profiler SPHardwareDataType | grep "Model Id" | cut -d : -f2 | sed 's/^ *//'`
	export MODEL_ID=`echo $mid`
}

get_model_name() {
	min=`system_profiler SPHardwareDataType | grep "Model Name" | cut -d : -f2 | sed 's/^ *//'`
	export MODEL_NAME=`echo $min`
}

get_rom() {
	r=`system_profiler SPHardwareDataType | grep ROM | cut -d : -f2 | sed 's/^ *//'`
	export ROM=`echo $r`
}

get_serial() {
	sr=`system_profiler SPHardwareDataType | grep Serial | cut -d : -f2 | sed 's/^ *//'`
	export SERIAL=`echo $sr`
}

get_smc() {
	sm=`system_profiler SPHardwareDataType | grep SMC | cut -d : -f2 | sed 's/^ *//'`
	export SMC=`echo $sm`
}


# 12.OCS
#get_cpu_cur_speed() {
#	csp=$[`sysctl -a | grep hw.cpufrequency: | cut -d: -f2 | sed 's/^ *//'` / 1000000]
#	export CURRENT_SPEED=`echo $csp`
#}

# 13.OCS
#get_cpu_socket() {
#	soc=`dmidecode 2>&1| grep "Socket Designation:" | cut -d: -f2 | sed 's/^ *//'`
#	export SOCKET=`echo $soc`
#}

# GET ALL FUNCTIOS
#get_query
get_cpu_mnfct
get_cpu_type
get_cpu_id
get_cpu_speed
get_cpu_cores
get_cpu_cachedos
get_cpu_arch
get_cpu_data_width
#get_cpu_current_addr_width
get_cpu_logical
get_cpu_volts
get_bus_speed
get_model_id
get_model_name
get_rom
get_serial
get_smc
#get_cpu_cur_speed
#get_cpu_socket


declare -a INFO=("\`$MANUFACTURER\`" "\`$TYPE\`" "\`$SERIALNUMBER\`" "\`$SPEED\`" "\`$CORES\`" "\`$L2CACHESIZE\`" "\`$CPUARCH\`" "\`$DATA_WIDTH\`" "\`$LOGICAL_CPUS\`" "\`$VOLTAGE\`" "\`$BUS_SPEED\`" "\`$MODEL_ID\`" "\`$MODEL_NAME\`" "\`$ROM\`" "\`$SERIAL\`" "\`$SMC\`");
#echo ${#INFO[@]} #Number of elements in the array
#echo ${#INFO}  #Number of characters in the first element of the array
#echo ${INFO[@]}
#echo ${INFO[@]/#/\`} #PREFIX
#echo ${INFO[@]/%/,} # CONTENT
echo ${INFO[@]/%/,}


#echo ""
#echo ""
#sleep 1
#for t in "${INFO[@]}"
#do
#echo $t
#done
#echo "esto es todo!"

#for t in "${INFO[@]}"
#printf "%s\n" "${INFO[@]}"