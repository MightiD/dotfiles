{self, ...}: {
    flake.nixosModules.desktopBase = {...}: let
        modules = with self.nixosModules; [
            foot
            theming
        ];
    in {
        imports = modules;
    };
}

