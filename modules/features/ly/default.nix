{inputs, moduleWithSystem, ...}: {
    flake.nixosModules.ly = moduleWithSystem({...}: {
        services.displayManager.ly.enable = true;
    });
}
