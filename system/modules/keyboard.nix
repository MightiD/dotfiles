{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        vial
        qmk
    ];
}
