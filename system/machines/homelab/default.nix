{ host, ... }:
{
    networking.hostName = host;

    users.users.mightid.openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM4UvKtX5mZ+/zbRrOqTRoykxyyYxdhAHycA12gbNlEr"
    ];

    imports = [
        ./disk-config.nix
        ./hardware-configuration.nix
        ../../common.nix
        ../../modules/boot.nix
        ../../modules/networking.nix
        ../../modules/syncthing.nix
        ../../modules/containers.nix
        ../../modules/samba.nix
        ../../modules/openvpn-server.nix
        ../../modules/containers/traefik.nix
        ../../modules/containers/jellyfin.nix
    ];
}
