{self, inputs, moduleWithSystem, ...}: {
    flake.nixosModules.tailscale-server = moduleWithSystem({pkgs, ...}: {
        imports = with self.nixosModules; [
            tailscale
        ];

        services.tailscale = {
            useRoutingFeatures = "server";

            extraUpFlags = [
                "--advertise-exit-node"
                "--advertise-routes=192.168.0.0/16"
            ];
        };
    });
}
