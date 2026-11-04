{inputs, moduleWithSystem, ...}: {
    flake.nixosModules.neovim = moduleWithSystem({pkgs, self', ...}: {
        environment.systemPackages = [
            self'.packages.neovim
        ];
    });

    perSystem = {pkgs, ...}: {
        packages.neovim = inputs.wrappers.lib.wrapPackage {
            inherit pkgs;
            package = pkgs.neovim;

            flags = {
                "-u" = ./init.lua;
            };
        };
    };
}
