{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        thunar
        thunar-archive-plugin
        thunar-volman
    ];
}
