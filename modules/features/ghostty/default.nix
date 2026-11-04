{inputs, moduleWithSystem, ...}: {
    flake.nixosModules.ghostty = moduleWithSystem({self', pkgs, ...}: {
        environment.systemPackages = [
            self'.packages.ghostty
        ];

        fonts.packages = with pkgs; [
            miracode
        ];
    });

    perSystem = {pkgs, lib, ...}: {
        packages.ghostty = inputs.wrappers.lib.wrapPackage {
            inherit pkgs;
            package = pkgs.ghostty;
            flags = {
                "--config-file" = {
                    data = ./config;
                    sep = "=";
                };
            };
        };
    };
}
