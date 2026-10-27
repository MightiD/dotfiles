{self, ...}: {
    flake.nixosModules.desktopBase = {...}: let
        modules = with self.nixosModules; [
            bluetooth
            foot
            theming
            cad
            school
        ];
    in {
        imports = modules;
    };
}

