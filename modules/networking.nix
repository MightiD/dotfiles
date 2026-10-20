{...}: {
    flake.nixosModules.networking = {...}: {
        networking = {
            networkmanager = {
                enable = true;
                dns = "none";
            };
            nameservers = [
                "192.168.255.1"
            ];
            firewall.enable = false;
        };

        systemd.services.NetworkManager-wait-online.enable = false;
    };
}
