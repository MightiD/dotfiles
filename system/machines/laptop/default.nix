{ ... }:
{
    networking.hostName = "miniNix";

    hardware.sensor.iio.enable = true;

    imports = [
        /etc/nixos/hardware-configuration.nix
        ../../common.nix
        ../../modules/boot.nix
        ../../modules/networking.nix
        ../../modules/kde.nix
        ../../modules/desktop-apps.nix
        ../../modules/ly.nix
        ../../modules/pipewire.nix
        ../../modules/theming.nix
        ../../modules/gaming.nix
        ../../modules/cad.nix
        ../../modules/bluetooth.nix
        ../../modules/school.nix
        ../../modules/syncthing.nix
        ../../modules/docker.nix
        ../../modules/printing.nix
    ];
}
