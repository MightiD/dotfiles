{self, inputs, ...}: {
    flake.nixosConfigurations.bigNix = inputs.nixpkgs.lib.nixosSystem {
        modules = with self.nixosModules; [
            system
            user
        ];
    };
}
