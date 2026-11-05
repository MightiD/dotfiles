{inputs, moduleWithSystem, ...}: {
    flake.nixosModules.nh = moduleWithSystem({...}: {
        programs.nh = {
            enable = true;
            clean = {
                enable = true;
                extraArgs = "--keep-since 4d --keep 3";
            };
        };
    });
}
