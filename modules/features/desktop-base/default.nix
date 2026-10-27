{self, ...}: {
    flake.nixosModules.desktopBase = {pkgs, ...}: let
        modules = with self.nixosModules; [
            bluetooth
            printing
            foot
            theming
            cad
            school
            firefox
            media
            office
            gaming
        ];
    in {
        imports = modules;

        environment.systemPackages = with pkgs; [
            wl-clipboard
        ];
    };
}

