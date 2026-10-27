{self, ...}: {
    flake.nixosModules.desktopHyprland = {...}: let
        modules = with self.nixosModules; [
            desktopBase
            hyprland
            waybar
            fuzzel
            keyboard
        ];
    in {
        imports = modules;
    };
}

