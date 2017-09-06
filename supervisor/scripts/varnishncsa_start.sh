#!/bin/bash
set -e

/usr/bin/varnishncsa -a -F "\'${VARNISHNCSA_LOGFORMAT}\'" -w ${VARNISHNCSA_LOGPATH}