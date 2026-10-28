{inputs, moduleWithSystem, ...}: {
    flake.nixosModules.hyprland = moduleWithSystem({pkgs, self', ...}: {
        programs.hyprland = {
            enable = true;
            package = self'.packages.hyprland;
        };

        environment.systemPackages = with pkgs; [
            hyprshot
            awww
            swaynotificationcenter
        ];
    });

    perSystem = {pkgs, lib, ...}:let
        config = pkgs.substitute {
            src = ./hyprland.lua;
            substitutions = [
                "--replace-fail" "@hyprsplit@" "${./plugins/hyprsplit.lua}"
            ];
        };
    in {
        packages.hyprland = inputs.wrappers.lib.wrapPackage {
            inherit pkgs;
            package = pkgs.hyprland;
            flags = {
                "--config" = config;
            };
        };
    };
}
