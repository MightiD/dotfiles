{self, inputs, moduleWithSystem, ...}: {
    flake.nixosModules.tailscale-client = moduleWithSystem({...}: {
        imports = with self.nixosModules; [
            tailscale
        ];

        services.tailscale = {
            useRoutingFeatures = "client";
        };
    });
}
