{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        thunar
        thunar-archive-plugin
        thunar-volman
        spotify
        ghostty
        imv
        mpv
        libreoffice
    ];

    programs.firefox.enable = true;
}
