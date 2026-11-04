{self, ...}: {
    flake.nixosModules.networking-miniNix = {pkgs, ...}: {
        imports = with self.nixosModules; [
            networking
            tailscale-client
        ];
    };
}
