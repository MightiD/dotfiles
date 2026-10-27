{self, ...}: {
    flake.nixosModules.desktopKde = {...}: let
        modules = with self.nixosModules; [
            desktopBase
            kde
            ly
        ];
    in {
        imports = modules;
    };
}

