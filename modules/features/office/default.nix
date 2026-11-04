{inputs, moduleWithSystem, ...}: {
    flake.nixosModules.office = moduleWithSystem({pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            libreoffice
        ];
    });
}
