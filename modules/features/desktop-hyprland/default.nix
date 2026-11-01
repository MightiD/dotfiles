{self, ...}: {
    flake.nixosModules.desktopHyprland = {...}: let
        modules = with self.nixosModules; [
            desktopBase
            theming-bigNix
            hyprland
            waybar
            fuzzel
            keyboard
        ];
    in {
        imports = modules;
    };
}

