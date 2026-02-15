#!/bin/bash
# Hyprland Undercover Uninstaller
# Author: John Varghese (https://github.com/John-Varghese-EH)
# Instagram: @cyber__trinity
# License: GPL-3.0

set -euo pipefail

# Get script directory for sourcing common functions
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Source common functions
if [[ -f "$SCRIPT_DIR/scripts/common.sh" ]]; then
    # shellcheck source=scripts/common.sh
    source "$SCRIPT_DIR/scripts/common.sh"
elif [[ -f "/usr/share/hyprland-undercover/scripts/common.sh" ]]; then
    # shellcheck source=common.sh
    source "/usr/share/hyprland-undercover/scripts/common.sh"
else
    # Fallback: define functions inline if common.sh not found
    msg() { echo "✔  $1"; }
    warn() { echo "⚠  $1" >&2; }
fi

CONFIG_DIR="$HOME/.config/hyprland-undercover"
STATE_FILE="$CONFIG_DIR/state"
SCRIPTS_DIR="$HOME/.local/bin"
APPLICATIONS_DIR="$HOME/.local/share/applications"
BACKGROUNDS_DIR="$HOME/.local/share/backgrounds/hyprland-undercover"

echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║            Hyprland Undercover Uninstaller                   ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

# 1. Restore original settings if Windows mode is active
if [[ -f "$STATE_FILE" ]]; then
    msg "Restoring original settings..."
    if [[ -f "$SCRIPTS_DIR/hyprland-undercover" ]]; then
        "$SCRIPTS_DIR/hyprland-undercover" --disable || true
    elif [[ -f "/usr/bin/hyprland-undercover" ]]; then
        /usr/bin/hyprland-undercover --disable || true
    fi
    msg "Original settings restored."
fi

# 2. Remove scripts
msg "Removing scripts..."
rm -f "$SCRIPTS_DIR/hyprland-undercover"
rm -f "$SCRIPTS_DIR/hyprland-undercover-setup"
rm -f "$SCRIPTS_DIR/hyprland-undercover-settings"
rm -f "$SCRIPTS_DIR/hyprland-undercover-launcher"
msg "Scripts removed."

# 3. Remove desktop files
msg "Removing desktop entries..."
rm -f "$APPLICATIONS_DIR/hyprland-undercover.desktop"
rm -f "$APPLICATIONS_DIR/hyprland-undercover-settings.desktop"
msg "Desktop entries removed."

# 4. Remove wallpaper
msg "Removing wallpaper..."
rm -rf "$BACKGROUNDS_DIR"
msg "Wallpaper removed."

# 5. Remove config directory
read -p "Remove configuration and backups? (y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    rm -rf "$CONFIG_DIR"
    msg "Configuration removed."
else
    msg "Configuration preserved at $CONFIG_DIR"
fi

# 6. Ask about removing themes (optional since they might be used elsewhere)
echo ""
read -p "Remove installed themes (Fluent, Bibata)? (y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    msg "Removing themes..."
    # Remove all Fluent and Bibata themes in one find command
    find "$HOME/.themes" "$HOME/.icons" -maxdepth 1 \
        \( -name "Fluent*" -o -name "Bibata*" \) \
        -exec rm -rf {} + 2>/dev/null || true
    msg "Themes removed."
else
    msg "Themes preserved."
fi

# 7. Clean up Hyprland config if needed
read -p "Remove Windows mode lines from hyprland.conf? (y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    HYPR_CONF="$HOME/.config/hypr/hyprland.conf"
    if [[ -f "$HYPR_CONF" ]]; then
        # Remove both Windows mode lines in a single sed pass
        sed -i -e '/# Hyprland Undercover - Windows Mode/d' \
               -e '/hyprland-undercover\/windows-mode.conf/d' "$HYPR_CONF"
        msg "Hyprland config cleaned."
    fi
fi

echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║               Uninstallation Complete!                        ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""
echo "Thank you for using Hyprland Undercover!"
echo "Author: John Varghese (@cyber__trinity)"
echo ""
