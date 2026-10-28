{...}: {
    flake.nixosModules.networking = {pkgs, ...}: {
        networking = {
            networkmanager = {
                enable = true;
                plugins = [ pkgs.networkmanager-openvpn ];
            };
            firewall.enable = false;
        };
        systemd.services.NetworkManager-wait-online.enable = false;
    };

}
