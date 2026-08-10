{ pkgs, ... }:
{
    imports = [
        ./networking.nix
    ];

    networking.nameservers = [ "192.168.255.1" ];
    networking.defaultGateway = "192.168.0.1";
    networking.interfaces.eno1 = {

        ipv4.addresses = [{
            address = "192.168.255.1";
            prefixLength = 16;
        }];

        wakeOnLan.enable = true;
    };

    environment.systemPackages = with pkgs; [
        wakeonlan
    ];
}
