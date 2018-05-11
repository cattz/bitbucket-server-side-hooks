#!/bin/bash

# Basic util functions


#timestamp
DATE=$(date '+%Y/%m/%d:%H:%M:%S')
# log folder
LOG_FOLDER="${DIR}/log"

mkdir -p "${LOG_FOLDER}"

log_to_num() {
	case ${1} in
		ERROR ) echo 40 ;;
	    WARNING ) echo 30 ;;
		DEBUG ) echo 10 ;;
	    * ) echo 20 ;;
	esac
}


log() {

	local level=${1}   # Deliberatly removed quotes to trim the level string
	local msg="${2}"
	local log_file=${3:-general.log}


	log_set_level=$(log_to_num ${LOGLEVEL})
	log_print_level=$(log_to_num ${level})

	if [ "${log_print_level}" -ge "${log_set_level}" ]; then
		echo "${DATE} [${level}] - ${msg}" | tee -a ${LOG_FOLDER}/hook_${log_file}
	fi
}


log_debug() { 
	log "DEBUG  " "${1}" "${2}"
}

log_info() { 
	log "INFO   " "${1}" "${2}"
}

log_warning() {
	log "WARNING" "${1}"m "${2}"
}

log_error() {
	log "ERROR  " "${1}" "${2}"
}
