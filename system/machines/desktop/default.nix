{ ... }:
{
    networking.hostName = "bigNix";

    imports = [
        /etc/nixos/hardware-configuration.nix
        ../../common.nix
        ../../modules/boot.nix
        ../../modules/networking-desktop.nix
        ../../modules/hypr.nix
        ../../modules/desktop-apps.nix
        ../../modules/pipewire.nix
        ../../modules/theming.nix
        ../../modules/gaming.nix
        ../../modules/cad.nix
        ../../modules/bluetooth.nix
        ../../modules/school.nix
        ../../modules/cifs.nix
        ../../modules/syncthing.nix
        ../../modules/keyboard.nix
        ../../modules/docker.nix
        ../../modules/printing.nix
    ];
}
