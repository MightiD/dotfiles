# helper.sh — runs after aconfmgr apply
# Handles service enablement and Flatpak apps (not managed by pacman)

# --- Services: all hosts ---
systemctl enable --now NetworkManager
systemctl enable --now sshd

# --- Per-host services ---
case "$(hostname)" in
  desktop)
    ;;
  laptop)
    systemctl enable --now sddm
    systemctl enable --now tlp
    systemctl enable --now bluetooth
    ;;
  tank)
    systemctl enable --now docker
    systemctl enable --now nftables
    ;;
esac

# --- Flatpaks: workstation hosts only ---
case "$(hostname)" in
  desktop|laptop)
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

    # Add Flatpak apps here, e.g.:
    # flatpak install -y flathub com.spotify.Client
    # flatpak install -y flathub com.obsproject.Studio
    ;;
esac
