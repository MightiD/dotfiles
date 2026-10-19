AddPackage bind
AddPackage btop
AddPackage cifs-utils
AddPackage devtools
AddPackage docker
AddPackage docker-compose
AddPackage dosfstools
AddPackage eza
AddPackage fastfetch
AddPackage inetutils
AddPackage less
AddPackage man-db
AddPackage man-pages
AddPackage neovim
AddPackage openbsd-netcat
AddPackage openssh
AddPackage reflector
AddPackage smartmontools
AddPackage syncthing
AddPackage tailscale
AddPackage tree
AddPackage vim
AddPackage wget
AddPackage which
AddPackage zsh
AddPackage zsh-autosuggestions
AddPackage zsh-completions
AddPackage zsh-syntax-highlighting

if [[ "$(hostname -s)" != homelab ]]; then
    AddPackage alsa-utils
    AddPackage bluetui
    AddPackage bluez
    AddPackage bluez-utils
    AddPackage cups
    AddPackage cups-pdf
    AddPackage firefox
    AddPackage flatpak
    AddPackage foot
    AddPackage ly
    AddPackage noto-fonts
    AddPackage noto-fonts-cjk
    AddPackage noto-fonts-emoji
    AddPackage pipewire
    AddPackage pipewire-alsa
    AddPackage pipewire-pulse
    AddPackage pavucontrol
    AddPackage wireplumber
    AddPackage ttf-dejavu
    AddPackage ttf-jetbrains-mono-nerd
    AddPackage ttf-liberation
    AddPackage ttf-nerd-fonts-symbols
    AddPackage woff2-font-awesome
fi

case "$(hostname -s)" in
    big-arch)
        AddPackage awww
        AddPackage breeze-icons
        AddPackage fuzzel
        AddPackage grim
        AddPackage hyprland
        AddPackage hyprshot
        AddPackage hyprpicker
        AddPackage kvantum
        AddPackage nwg-look
        AddPackage qt5-wayland
        AddPackage qt6-wayland
        AddPackage qt6ct
        AddPackage slurp
        AddPackage swaync
        AddPackage pcmanfm-qt
        AddPackage waybar
        AddPackage xdg-desktop-portal-hyprland
        AddPackage xdg-utils
        ;;
    mini-arch)
        AddPackage plasma
        AddPackage dolphin
        AddPackage iio-sensor-proxy
        ;;
    homelab)
        ;;
esac
