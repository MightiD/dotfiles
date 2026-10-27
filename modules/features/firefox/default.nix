{inputs, moduleWithSystem, ...}: {
    flake.nixosModules.firefox = moduleWithSystem({...}: {
        programs.firefox.enable = true;
    });
}
