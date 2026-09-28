# 00-base.sh — packages and config shared across all hosts

AddPackage base
AddPackage base-devel
AddPackage linux
AddPackage linux-firmware
AddPackage networkmanager
AddPackage openssh
AddPackage git
AddPackage neovim
AddPackage htop
AddPackage curl
AddPackage wget
AddPackage zsh
AddPackage man-db
AddPackage man-pages
AddPackage fzf
AddPackage ripgrep
AddPackage bat
AddPackage eza
AddPackage tmux

# Locale
cat > "$(CreateFile /etc/locale.gen)" << 'EOF'
en_GB.UTF-8 UTF-8
EOF

cat > "$(CreateFile /etc/locale.conf)" << 'EOF'
LANG=en_GB.UTF-8
EOF

cat > "$(CreateFile /etc/vconsole.conf)" << 'EOF'
KEYMAP=uk
EOF
