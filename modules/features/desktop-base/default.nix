{self, ...}: {
    flake.nixosModules.desktopBase = {pkgs, ...}: let
        modules = with self.nixosModules; [
            bluetooth
            foot
            theming
            cad
            school
            firefox
            media
        ];
    in {
        imports = modules;

        environment.systemPackages = with pkgs; [
            wl-clipboard
        ];
    };
}

