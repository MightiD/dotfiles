{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        freecad
        orca-slicer
        arduino-ide
        kicad
    ];
}
