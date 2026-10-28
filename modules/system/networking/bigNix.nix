{self, ...}: {
    flake.nixosModules.networking-bigNix = {pkgs, ...}: {
        imports = with self.nixosModules; [
            networking
            tailscale-client
        ];
        networking.networkmanager.ensureProfiles.profiles.lan = {
            connection = {
                id = "lan";
                type = "ethernet";
                interface-name = "enp9s0";
                autoconnect = true;
            };
            ipv4 = {
                method = "manual";
                address1 = "192.168.100.100/16,192.168.0.1";
                dns = "192.168.255.1;";
            };
            ipv6.method = "disabled";
        };
    };
}
