{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        vial
        qmk
    ];

    hardware.keyboard.qmk.enable = true;
}
