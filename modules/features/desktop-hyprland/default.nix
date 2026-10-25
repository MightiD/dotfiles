{self, ...}: {
    flake.nixosModules.desktopHyprland = {...}: let
        modules = with self.nixosModules; [
            hyprland
            waybar
        ];
    in {
        imports = modules;
    };
}

