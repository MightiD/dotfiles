{self, ...}: {
    flake.nixosModules.desktopKde = {...}: let
        modules = with self.nixosModules; [
            desktopBase
            kde
        ];
    in {
        imports = modules;
    };
}

