{self, ...}: {
    flake.nixosModules.desktopBase = {...}: let
        modules = with self.nixosModules; [
            foot
            stylix
        ];
    in {
        imports = modules;
    };
}

