{ pkgs, lib, config, host, ... }:
lib.mkMerge [
    {
        networking.networkmanager = {
            enable = true;
            plugins = with pkgs; [
                networkmanager-openvpn
            ];
        };

        services.tailscale = {
            enable = true;

            useRoutingFeatures = if host == "homelab" then "server" else "client";
        };

        networking.nftables.enable = true;

        networking.firewall = {
            enable = true;

            trustedInterfaces = [ config.services.tailscale.interfaceName ];

            allowedUDPPorts = [ config.services.tailscale.port ];
        };

        systemd.services.tailscaled.serviceConfig.Environment = [
            "TS_DEBUG_FIREWALL_MODE=nftables"
        ];

        systemd.network.wait-online.enable = false;
        boot.initrd.systemd.network.wait-online.enable = false;
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
