{ pkgs, lib, host, ... }:
lib.mkMerge [
    {
        networking.networkmanager = {
            enable = true;
            plugins = with pkgs; [
                networkmanager-openvpn
            ];
        };
    }

    (lib.mkIf (host == "bigNix") {
        networking.nameservers = [ "192.168.255.1" ];
        networking.defaultGateway = "192.168.0.1";

        networking.interfaces.enp9s0 = {
            ipv4.addresses = [{
                address = "192.168.100.100";
                prefixLength = 16;
            }];

            wakeOnLan.enable = true;
        };
    })
    (lib.mkIf (host == "homelab") {
        networking.nameservers = [ "192.168.255.1" ];
        networking.defaultGateway = "192.168.0.1";

        networking.interfaces.eno1 = {
            ipv4.addresses = [{
                address = "192.168.100.100";
                prefixLength = 16;
            }];

            wakeOnLan.enable = true;
        };
    })
]
