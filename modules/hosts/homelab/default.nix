{self, inputs, ...}: {
    flake.nixosConfigurations.homelab = inputs.nixpkgs.lib.nixosSystem {
        modules = with self.nixosModules; [
            homelabHostConfiguration
            system
            smbServer
            openvpnServer
        ];
    };
}
