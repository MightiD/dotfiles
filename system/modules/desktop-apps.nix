{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        spotify
        ghostty
        imv
        mpv
        libreoffice
    ];

    programs.firefox.enable = true;
}
