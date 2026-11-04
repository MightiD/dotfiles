{inputs, moduleWithSystem, ...}: {
    flake.nixosModules.waybar = moduleWithSystem({self', ...}: {
        environment.systemPackages = [
            self'.packages.waybar
        ];
    });

    perSystem = {pkgs, lib, ...}: {
        packages.waybar = inputs.wrappers.lib.wrapPackage {
            inherit pkgs;
            package = pkgs.waybar;
            flags = {
                "--config" = ./config.jsonc;
                "--style" = ./style.css;
            };
        };
    };
}
