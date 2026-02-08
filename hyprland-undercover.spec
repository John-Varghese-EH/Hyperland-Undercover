Name:           hyprland-undercover
Version:        1.0.0
Release:        1%{?dist}
Summary:        Transform your Hyprland desktop into Windows 11

License:        GPL-3.0-or-later
URL:            https://github.com/John-Varghese-EH/Hyprland-Undercover
Source0:        %{name}-%{version}.tar.gz

BuildArch:      noarch
BuildRequires:  python3-devel

Requires:       bash
Requires:       hyprland
Requires:       waybar
Requires:       jq
Requires:       python3
Requires:       python3-gobject
Requires:       gtk4
Requires:       libadwaita

Recommends:     rofi
Suggests:       wofi
Suggests:       swww

%description
Hyprland Undercover transforms your Hyprland desktop into a convincing
Windows 11 environment with a single command. It includes a Windows 11-style
taskbar (Waybar), start menu (Rofi/Wofi), and matching themes.

%prep
%setup -q

%install
mkdir -p %{buildroot}/usr/bin
mkdir -p %{buildroot}/usr/share/hyprland-undercover
mkdir -p %{buildroot}/usr/share/applications
mkdir -p %{buildroot}/usr/share/icons/hicolor/scalable/apps

# Install scripts
install -m 755 scripts/hyprland-undercover %{buildroot}/usr/bin/hyprland-undercover
install -m 755 scripts/hyprland-undercover-setup %{buildroot}/usr/bin/hyprland-undercover-setup
install -m 755 scripts/hyprland-undercover-settings %{buildroot}/usr/bin/hyprland-undercover-settings

# Install data files
cp -r configs %{buildroot}/usr/share/hyprland-undercover/
cp -r assets %{buildroot}/usr/share/hyprland-undercover/

# Install icons
install -m 644 assets/start-icon.svg %{buildroot}/usr/share/icons/hicolor/scalable/apps/hyprland-undercover.svg

# Create desktop files
cat <<EOF > %{buildroot}/usr/share/applications/hyprland-undercover.desktop
[Desktop Entry]
Name=Hyprland Undercover
Comment=Transform your Hyprland desktop into Windows 11
Exec=/usr/bin/hyprland-undercover
Icon=hyprland-undercover
Terminal=false
Type=Application
Categories=Utility;Settings;
EOF

cat <<EOF > %{buildroot}/usr/share/applications/hyprland-undercover-settings.desktop
[Desktop Entry]
Name=Hyprland Undercover Settings
Comment=Configure Hyprland Undercover
Exec=/usr/bin/hyprland-undercover-settings
Icon=preferences-system
Terminal=false
Type=Application
Categories=Settings;
EOF

%files
/usr/bin/hyprland-undercover
/usr/bin/hyprland-undercover-setup
/usr/bin/hyprland-undercover-settings
/usr/share/hyprland-undercover/
/usr/share/applications/hyprland-undercover.desktop
/usr/share/applications/hyprland-undercover-settings.desktop
/usr/share/icons/hicolor/scalable/apps/hyprland-undercover.svg

%changelog
* Sat Feb 08 2026 John Varghese <john@example.com> - 1.0.0-1
- Initial release
