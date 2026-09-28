# 10-desktop.sh — Hyprland desktop (hostname: desktop)

[ "$(hostname)" = "desktop" ] || return

# GPU — adjust: vulkan-radeon / nvidia / vulkan-intel
AddPackage mesa
AddPackage vulkan-radeon
AddPackage libva-mesa-driver

# Hyprland
AddPackage hyprland
AddPackage xdg-desktop-portal-hyprland
AddPackage waybar
AddPackage fuzzel
AddPackage awww
AddPackage grim
AddPackage slurp
AddPackage ghostty

# File manager
AddPackage thunar
AddPackage gvfs
