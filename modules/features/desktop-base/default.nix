{self, ...}: {
    flake.nixosModules.desktopBase = {...}: let
        modules = with self.nixosModules; [
            foot
        ];
    in {
        imports = modules;
    };
}

