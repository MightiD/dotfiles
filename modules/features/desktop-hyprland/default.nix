{self, ...}: {
    flake.nixosModules.desktopHyprland = {...}: let
        modules = with self.nixosModules; [
            hyprland
            waybar
            fuzzel
        ];
    in {
        imports = modules;
    };
}

