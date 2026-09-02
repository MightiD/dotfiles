{ pkgs, ... }:
{
    programs.neovim.defaultEditor = true;

    environment.systemPackages = with pkgs; [
        gcc
        gnumake
        binutils
        lazygit
        neovim
        tmux
        man-pages
        man-pages-posix
    ];

    documentation.dev.enable = true;
}
