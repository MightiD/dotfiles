{inputs, moduleWithSystem, ...}: {
    flake.nixosModules.hyprland = moduleWithSystem({pkgs, self', ...}: {
        programs.zsh = {
            package = self'.packages.zsh;
        };
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
