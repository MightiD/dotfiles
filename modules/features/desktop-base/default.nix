{self, ...}: {
    flake.nixosModules.desktopBase = {...}: let
        modules = with self.nixosModules; [
            bluetooth
            foot
            theming
            cad
            school
            firefox
        ];
    in {
        imports = modules;
    };
}

