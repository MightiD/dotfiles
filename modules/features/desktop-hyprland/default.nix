{self, ...}: {
    flake.nixosModules.desktopHyprland = {...}: let
        modules = with self.nixosModules; [
            hyprland
        ];
    in {
        imports = modules;
    };
}

