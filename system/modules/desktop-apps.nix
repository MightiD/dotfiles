{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        spotify
        ghostty
        imv
        mpv
        libreoffice
        wl-clipboard
    ];

    programs.firefox.enable = true;
}
