{self, ...}: {
    flake.nixosModules.desktopKde = {...}: let
        modules = with self.nixosModules; [
            desktopBase
            theming-miniNix
            kde
            ly
        ];
    in {
        imports = modules;
    };
}

