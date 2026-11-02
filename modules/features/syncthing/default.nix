{inputs, moduleWithSystem, ...}: {
    flake.nixosModules.syncthing = moduleWithSystem({pkgs, ...}: {
        services.syncthing = {
            enable = true;
            openDefaultPorts = true;
            user = "mightid";
            dataDir = "/home/mightid";
            configDir = "/home/mightid/.config/syncthing";
            guiAddress = "0.0.0.0:8384";
        };
    });
}
