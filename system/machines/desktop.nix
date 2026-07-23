{ ... }:
{
    networking.hostName = "nixos";

    imports = [
        ../common.nix
        ../modules/networking-desktop.nix
        ../modules/hypr.nix
        ../modules/desktop-apps.nix
        ../modules/pipewire.nix
        ../modules/theming.nix
        ../modules/gaming.nix
        ../modules/cad.nix
        ../modules/bluetooth.nix
        ../modules/school.nix
        ../modules/cifs.nix
        ../modules/syncthing.nix
        ../modules/keyboard.nix
    ];
}
