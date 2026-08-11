{ ... }:
{
    networking.hostName = "homelab";

    users.users.mightid.openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM4UvKtX5mZ+/zbRrOqTRoykxyyYxdhAHycA12gbNlEr"
    ];

    imports = [
        ./disk-config.nix
        ./hardware-configuration.nix
        ../../common.nix
        ../../modules/boot.nix
        ../../modules/networking-homelab.nix
        ../../modules/syncthing.nix
        ../../modules/docker.nix
    ];
}
