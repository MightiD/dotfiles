{self, inputs, ...}: {
    flake.nixosConfigurations.miniNix = inputs.nixpkgs.lib.nixosSystem {
        modules = with self.nixosModules; [
            miniNixHostConfiguration
            system
        ];
    };
}
