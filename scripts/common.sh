#!/bin/bash
# Common functions for Hyprland Undercover scripts
# Author: John Varghese (https://github.com/John-Varghese-EH)
# License: GPL-3.0

# Output helper functions
msg() {
    echo "✔  $1"
}

error() {
    echo "✖  $1" >&2
    exit 1
}

warn() {
    echo "⚠  $1" >&2
}

# Check if a command exists
command_exists() {
    command -v "$1" &>/dev/null
}
