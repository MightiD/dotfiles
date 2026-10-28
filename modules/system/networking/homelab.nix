{self, ...}: {
    flake.nixosModules.networking-homelab = {pkgs, ...}: {
        imports = with self.nixosModules; [
            networking
            tailscale-server
        ];
        networking.networkmanager.ensureProfiles.profiles.lan = {
            connection = {
                id = "lan";
                type = "ethernet";
                interface-name = "eno1";
                autoconnect = true;
            };
            ipv4 = {
                method = "manual";
                address1 = "192.168.255.1/16,192.168.0.1";
                dns = "192.168.255.1;";
            };
            ipv6.method = "disabled";
        };
    };
}
