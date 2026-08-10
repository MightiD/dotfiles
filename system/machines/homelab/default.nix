{ ... }:
{
    networking.hostName = "bigNix";

    imports = [
        ../../common.nix
        ../../modules/boot.nix
        ../../modules/networking-homelab.nix
        ../../modules/syncthing.nix
        ../../modules/docker.nix
    ];
}
