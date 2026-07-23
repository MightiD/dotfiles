{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        rnote
        obsidian
    ];
}
