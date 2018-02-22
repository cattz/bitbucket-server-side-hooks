#!/bin/bash

# Basic util functions

#timestamp
DATE=$(date '+%Y/%m/%d:%H:%M:%S')
# log folder
LOG_FOLDER="${DIR}/log"

mkdir -p ${LOG_FOLDER}

function log_base {

	log_file=${1}
	level=${2}
	msg=${3}
	echo "${DATE} ${level} - ${msg}" >> ${LOG_FOLDER}/hook_${log_file}
}

function log_debug {
	if [ ${LOGLEVEL} == "DEBUG" ]; then
		log_base ${1} "[ DEBUG ]" "${2}"
	fi
}

function log_info {
	log_base ${1} "[ INFO  ]" "${2}"
}