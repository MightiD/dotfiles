{inputs, moduleWithSystem, ...}: {
    flake.nixosModules.foot = moduleWithSystem({self', ...}: {
        environment.systemPackages = [
            self'.packages.foot
        ];
    });

    perSystem = {pkgs, lib, ...}: {
        packages.foot = inputs.wrappers.lib.wrapPackage {
            inherit pkgs;
            package = pkgs.foot;
            flags = {
                "--config" = ./foot.ini;
            };
        };
    };
}
