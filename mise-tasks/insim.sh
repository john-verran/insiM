#!/bin/bash

# insiM runner script
# Usage: ./scripts/insim.sh <config_file>

set -euo pipefail  # Exit on any error, undefined variables, and pipe failures

if [ $# -eq 0 ]; then
    echo "Usage: mise run insim <path_to_config_file>"
    exit 1
fi

CONFIG_FILE="$1"

# Check if config file exists
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Error: Config file '$CONFIG_FILE' does not exist"
    exit 1
fi

# Get the directory containing the config file
CONFIG_DIR="$(dirname "$CONFIG_FILE")"
CONFIG_NAME="$(basename "$CONFIG_FILE")"

# Get the absolute path to the project root (where this script is located)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Navigate to the config directory and run the script
cd "$CONFIG_DIR"
uv run "$PROJECT_ROOT/src/insiM_v1.1.py" -config "$CONFIG_NAME"
