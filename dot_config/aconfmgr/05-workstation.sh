# 05-workstation.sh — shared config for all GUI hosts

case "$(hostname)" in
  desktop|laptop) ;;
  *) return ;;
esac

# Audio
AddPackage pipewire
AddPackage pipewire-pulse
AddPackage wireplumber
AddPackage pavucontrol

# Fonts
AddPackage ttf-jetbrains-mono-nerd
AddPackage noto-fonts
AddPackage noto-fonts-emoji

# Portal + clipboard
AddPackage xdg-desktop-portal-gtk
AddPackage wl-clipboard

# Flatpak
AddPackage flatpak

# Apps
AddPackage firefox
