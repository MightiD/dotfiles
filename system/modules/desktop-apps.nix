{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        thunar
        thunar-archive-plugin
        thunar-volman
        ghostty
        imv
        libreoffice
    ];

    programs.firefox.enable = true;
}
