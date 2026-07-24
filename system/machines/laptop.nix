{ ... }:
{
    networking.hostName = "nixos";

    imports = [
        ../common.nix
        ../modules/boot-laptop.nix
        ../modules/networking-laptop.nix
        ../modules/kde.nix
        ../modules/desktop-apps.nix
        ../modules/ly.nix
        ../modules/pipewire.nix
        ../modules/theming.nix
        ../modules/gaming.nix
        ../modules/cad.nix
        ../modules/bluetooth.nix
        ../modules/school.nix
        ../modules/syncthing.nix
        ../modules/docker.nix
    ];
}
