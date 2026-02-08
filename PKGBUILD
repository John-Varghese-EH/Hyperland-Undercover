# Maintainer: John Varghese <john@example.com>
# GitHub: https://github.com/John-Varghese-EH
pkgname=hyprland-undercover
pkgver=1.0.0
pkgrel=1
pkgdesc="Transform your Hyprland desktop into Windows 11"
arch=('any')
url="https://github.com/John-Varghese-EH/Hyprland-Undercover"
license=('GPL-3.0-or-later')
depends=(
    'bash'
    'hyprland'
    'waybar'
    'jq'
    'python'
    'python-gobject'
    'gtk4'
    'libadwaita'
)
optdepends=(
    'rofi: Application launcher (recommended)'
    'wofi: Alternative application launcher'
    'swww: Wallpaper daemon'
    'hyprpaper: Alternative wallpaper daemon'
    'wlogout: Power menu'
)
makedepends=('git')
source=("git+$url.git")
sha256sums=('SKIP')

package() {
    cd "$srcdir/Hyprland-Undercover"
    
    # 1. Install scripts
    install -Dm755 scripts/hyprland-undercover "$pkgdir/usr/bin/hyprland-undercover"
    install -Dm755 scripts/hyprland-undercover-setup "$pkgdir/usr/bin/hyprland-undercover-setup"
    install -Dm755 scripts/hyprland-undercover-settings "$pkgdir/usr/bin/hyprland-undercover-settings"
    
    # 2. Install desktop files
    install -Dm644 assets/hyprland-undercover.desktop "$pkgdir/usr/share/applications/hyprland-undercover.desktop"
    
    # Create settings desktop file
    mkdir -p "$pkgdir/usr/share/applications"
    cat <<EOF > "$pkgdir/usr/share/applications/hyprland-undercover-settings.desktop"
[Desktop Entry]
Name=Hyprland Undercover Settings
Comment=Configure Hyprland Undercover
Exec=/usr/bin/hyprland-undercover-settings
Icon=preferences-system
Terminal=false
Type=Application
Categories=Settings;
EOF
    
    # 3. Install data files
    mkdir -p "$pkgdir/usr/share/hyprland-undercover"
    cp -r configs "$pkgdir/usr/share/hyprland-undercover/"
    cp -r assets "$pkgdir/usr/share/hyprland-undercover/"
    
    # 4. Install icons
    install -Dm644 assets/start-icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/hyprland-undercover.svg"
    
    # 5. License and docs
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
