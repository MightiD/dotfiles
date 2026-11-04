{self, ...}: {
    flake.nixosModules.desktopBase = {pkgs, ...}: let
        modules = with self.nixosModules; [
            audio
            bluetooth
            cifs
            printing
            ghostty
            cad
            school
            firefox
            media
            office
            gaming
            vscodium
        ];
    in {
        imports = modules;

        environment.systemPackages = with pkgs; [
            wl-clipboard
        ];
    };
}

