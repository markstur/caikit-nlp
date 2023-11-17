#!/usr/bin/env bash
cd $(dirname ${BASH_SOURCE[0]})/..
mkdir -p models

# SERVER env var can be grpc or http (will run both if not set or zero len)
[[ -z "${SERVER}" ]] && server="" || server=".${SERVER}_server"

export LOG_LEVEL=${LOG_LEVEL:-info}
export CONFIG_FILES=${CONFIG_FILES:-runtime_config.yaml}
export LOG_FORMATTER=${LOG_FORMATTER:-pretty}

python -m caikit.runtime${server}
