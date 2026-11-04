{inputs, moduleWithSystem, ...}: {
    flake.nixosModules.fuzzel = moduleWithSystem({self', ...}: {
        environment.systemPackages = [
            self'.packages.fuzzel
        ];
    });

    perSystem = {pkgs, lib, ...}: {
        packages.fuzzel = inputs.wrappers.lib.wrapPackage {
            inherit pkgs;
            package = pkgs.fuzzel;
            flags = {
                "--config" = ./fuzzel.ini;
            };
        };
    };
}
