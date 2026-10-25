{inputs, moduleWithSystem, ...}: {
    flake.nixosModules.syncthing = moduleWithSystem({pkgs, ...}: {
        services.syncthing = {
            enable = true;
            openDefaultPorts = true;

            guiAddress = "0.0.0.0:8384";
        };
    });
}
