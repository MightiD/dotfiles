{self, ...}: {
    flake.nixosModules.networking-homelab = {pkgs, ...}: {
        imports = with self.nixosModules; [
            networking
            tailscale-server
        ];
        networking.networkmanager = {
            settings.main."no-auto-default" = "eno1";

            ensureProfiles.profiles.lan = {
                connection = {
                    id = "lan";
                    type = "ethernet";
                    interface-name = "eno1";
                    autoconnect = true;
                    autoconnect-priority = 100;
                };

                ipv4 = {
                    method = "manual";
                    address1 = "192.168.255.1/16,192.168.0.1";
                    dns = "192.168.255.1;";
                };
                ipv6.method = "disabled";

                ethernet.wake-on-lan = "magic";
            };
        };
    };
}
