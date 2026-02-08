<div align="center">

  <img src="hyperland-undercover.png" alt="Hyprland Undercover Logo" width="120" />

# Hyprland Undercover 🕵️

[![PPA](https://img.shields.io/badge/PPA-Launchpad-E95420?logo=ubuntu&logoColor=white)](https://launchpad.net/hyperland-undercover)
[![AUR](https://img.shields.io/badge/AUR-Arch_Linux-1793D1?logo=archlinux&logoColor=white)](https://aur.archlinux.org/packages/hyprland-undercover)
[![COPR](https://img.shields.io/badge/COPR-Fedora-51A2DA?logo=fedora&logoColor=white)](https://copr.fedorainfracloud.org/coprs/hyprland-undercover/)
[![License](https://img.shields.io/badge/License-GPL--3.0-blue.svg)](LICENSE)
[![GitHub Stars](https://img.shields.io/github/stars/John-Varghese-EH/Hyprland-Undercover?style=social)](https://github.com/John-Varghese-EH/Hyprland-Undercover)

**Transform your Hyprland desktop into a convincing Windows 11 environment with a single command.**

Inspired by [Kali Undercover](https://www.kali.org/docs/introduction/kali-undercover/), but for Hyprland/Wayland users.

</div>

---

> [!NOTE]
> **🚧 Work in Progress:**  
> This project is actively being developed! Contributions, feedback, and ideas are welcome.  
> *Star the repo and join the project!*

---

## ✨ Features

- **One-Click Transformation:** Instantly toggle between native Hyprland and Windows 11 look
- **Windows 11-Style Taskbar:** Bottom-aligned Waybar with centered icons, system tray, and clock
- **Windows 11-Style Start Menu:** Rofi/Wofi configured with grid layout and Fluent design
- **Complete Visual Overhaul:** Fluent GTK theme, icons, cursors, and wallpaper
- **Safe Backup & Restore:** Original configurations are automatically backed up
- **GTK4 Settings App:** Modern Libadwaita GUI for easy configuration
- **Multi-Distro Support:** Works with apt, pacman, dnf, and zypper

---

## 📸 Screenshots

<!-- Add your screenshots here -->
<div align="center">
<i>Screenshots coming soon! Star the repo to get notified.</i>
</div>

---

## 📦 Installation

### 🏹 Arch Linux (AUR)

```bash
yay -S hyprland-undercover
```

### 🐧 Debian/Ubuntu

Download the `.deb` from [Releases](https://github.com/John-Varghese-EH/Hyprland-Undercover/releases):

```bash
sudo dpkg -i hyprland-undercover_*.deb
sudo apt install -f
```

### 🎩 Fedora (COPR)

```bash
sudo dnf copr enable john-varghese/hyprland-undercover
sudo dnf install hyprland-undercover
```

### 🔧 From Source

```bash
git clone https://github.com/John-Varghese-EH/Hyprland-Undercover.git
cd Hyprland-Undercover
./scripts/hyprland-undercover-setup
```

---

## 🚀 Usage

### Toggle Mode

```bash
hyprland-undercover
```

Or search for **"Hyprland Undercover"** in your application menu.

### Enable Windows 11 Mode

```bash
hyprland-undercover --enable
```

### Disable and Restore

```bash
hyprland-undercover --disable
```

### Check Status

```bash
hyprland-undercover --status
```

### Settings GUI

Search for **"Hyprland Undercover Settings"** or run:

```bash
hyprland-undercover-settings
```

---

## 🎨 What Gets Changed

When enabling Windows 11 mode:

| Component | Change |
|-----------|--------|
| **Waybar** | Windows 11-style bottom taskbar |
| **Rofi/Wofi** | Windows 11-style start menu |
| **Hyprland** | Windows-like animations, decorations, and keybinds |
| **GTK Theme** | Fluent-round-Dark |
| **Icons** | Fluent-dark |
| **Cursor** | Bibata-Modern-Ice |
| **Wallpaper** | Windows 11-like wallpaper |

All changes are **reversible** - your original configurations are backed up automatically.

---

## 🔧 Requirements

- Hyprland
- Waybar
- Rofi or Wofi
- Python 3 with GTK4/Libadwaita bindings
- jq

These are installed automatically by the setup script.

---

## 🧹 Uninstallation

```bash
./uninstall.sh
```

Or if installed via package manager:

```bash
# Arch
sudo pacman -R hyprland-undercover

# Debian/Ubuntu
sudo apt remove hyprland-undercover

# Fedora
sudo dnf remove hyprland-undercover
```

---

## 🕵️ Why Hyprland Undercover?

[Kali Undercover](https://www.kali.org/docs/introduction/kali-undercover/) is a fantastic tool for transforming Kali Linux to look like Windows, providing privacy and blending in during sensitive situations. However, **it only supports Xfce**.

**Hyprland Undercover** brings this functionality to Hyprland users, enabling instant transformation on the modern Wayland compositor.

---

## �️ Using GNOME? Check out GNOME-Undercover!

<div align="center">

[![GNOME Undercover](https://img.shields.io/badge/GNOME_Undercover-Project-4A86CF?style=for-the-badge&logo=gnome&logoColor=white)](https://github.com/John-Varghese-EH/Gnome-Undercover)

</div>

If you're using **GNOME** instead of Hyprland, check out **[GNOME-Undercover](https://github.com/John-Varghese-EH/Gnome-Undercover)** - the sister project that transforms your GNOME desktop into Windows 10/11 with:

- ✨ Dash-to-Panel for Windows-style taskbar
- 🚀 ArcMenu for Windows-style start menu
- 🎨 Fluent GTK themes and icons
- 🔄 One-click toggle between GNOME and Windows mode

**[👉 Get GNOME-Undercover](https://github.com/John-Varghese-EH/Gnome-Undercover)**

---

## 🎉 Fun Add-on: Activate-linux

Want to take your Windows disguise to the next level?  
Pair Gnome-Undercover with [activate-linux](https://github.com/MrGlockenspiel/activate-linux)-a hilarious open-source prank that displays the classic “Activate Windows” watermark on your Linux desktop!

> **Description:**  
> _Fool your friends, colleagues, or even yourself with a touch of Windows authenticity. **Activate-linux** is the perfect companion for your undercover adventures!_

**Try it out:**  
[github.com/MrGlockenspiel/activate-linux](https://github.com/MrGlockenspiel/activate-linux)

---

## 🙏 Credits

This project uses:

- **[Fluent GTK & Icon Themes](https://github.com/vinceliuice/Fluent-gtk-theme)** by vinceliuice
- **[Bibata Cursor Theme](https://github.com/ful1e5/Bibata_Cursor)** by ful1e5
- **[Waybar](https://github.com/Alexays/Waybar)** by Alexays
- **[Rofi](https://github.com/davatorium/rofi)** by davatorium

---

## 📜 License

This project is licensed under the **GPL-3.0**. See the [LICENSE](LICENSE) file for details.

---

<div align="center">

Crafted with ❤️ by **[John Varghese](https://github.com/John-Varghese-EH)**

[![Buy me a Coffee](https://img.shields.io/badge/Buy_Me_A_Coffee-FFDD00?style=for-the-badge&logo=buy-me-a-coffee&logoColor=black)](https://buymeacoffee.com/CyberTrinity)
[![Patreon](https://img.shields.io/badge/Patreon-F96854?style=for-the-badge&logo=patreon&logoColor=white)](https://patreon.com/CyberTrinity)
[![Sponsor](https://img.shields.io/badge/sponsor-30363D?style=for-the-badge&logo=GitHub-Sponsors&logoColor=#white)](https://github.com/sponsors/John-Varghese-EH)

</div>
