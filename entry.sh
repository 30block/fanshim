#!/bin/sh

FANSHIM_ON_TEMP=${FANSHIM_ON_TEMP:-65}
FANSHIM_OFF_TEMP=${FANSHIM_OFF_TEMP:-55}
FANSHIM_DELAY=${FANSHIM_DELAY:-5}
FANSHIM_VERBOSE=${FANSHIM_VERBOSE:-0}

# Use $@ to manage arguments
set -- --on-threshold "${FANSHIM_ON_TEMP}" \
	--off-threshold "${FANSHIM_OFF_TEMP}" \
	--delay "${FANSHIM_DELAY}" \
	--preempt \
	--noled

if [ "${FANSHIM_VERBOSE}" = "1" ]; then
	# Add verbose argument
	set -- "$@" --verbose
fi

python3 control.py "$@"
