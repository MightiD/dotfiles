# 10-laptop.sh — KDE Plasma laptop (hostname: laptop)

[ "$(hostname)" = "laptop" ] || return

# GPU — adjust for hardware
AddPackage mesa
AddPackage vulkan-intel
AddPackage intel-media-driver

# Power management
AddPackage tlp
AddPackage powertop

# KDE Plasma
AddPackage plasma-meta
AddPackage sddm
AddPackage plasma-wayland-session
AddPackage xdg-desktop-portal-kde
AddPackage dolphin
AddPackage konsole

# Bluetooth
AddPackage bluez
AddPackage bluez-utils
AddPackage bluedevil
