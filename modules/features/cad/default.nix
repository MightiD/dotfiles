{inputs, moduleWithSystem, ...}: {
    flake.nixosModules.cad = moduleWithSystem({pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            freecad
            orca-slicer
            arduino-ide
            kicad
        ];
    });
}
