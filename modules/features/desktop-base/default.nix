{self, ...}: {
    flake.nixosModules.desktopBase = {...}: let
        modules = with self.nixosModules; [
            foot
            theming
            cad
            school
        ];
    in {
        imports = modules;
    };
}

