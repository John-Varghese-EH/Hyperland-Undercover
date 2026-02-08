#!/bin/bash
# Hyprland Undercover Uninstaller
# Author: John Varghese (https://github.com/John-Varghese-EH)
# Instagram: @cyber__trinity
# License: GPL-3.0

set -euo pipefail

CONFIG_DIR="$HOME/.config/hyprland-undercover"
STATE_FILE="$CONFIG_DIR/state"
SCRIPTS_DIR="$HOME/.local/bin"
APPLICATIONS_DIR="$HOME/.local/share/applications"
BACKGROUNDS_DIR="$HOME/.local/share/backgrounds/hyprland-undercover"

msg() {
    echo "✔  $1"
}

warn() {
    echo "⚠  $1" >&2
}

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
    rm -rf "$HOME/.themes/Fluent"*
    rm -rf "$HOME/.icons/Fluent"*
    rm -rf "$HOME/.icons/Bibata"*
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
        sed -i '/# Hyprland Undercover - Windows Mode/d' "$HYPR_CONF"
        sed -i '/hyprland-undercover\/windows-mode.conf/d' "$HYPR_CONF"
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
