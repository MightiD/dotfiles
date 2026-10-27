{inputs, moduleWithSystem, ...}: {
    flake.nixosModules.openssh = moduleWithSystem({pkgs, ...}: {
        services.openssh = {
            enable = true;
        };
    });
}
