{ ... }:
{
    networking.hostName = "nixos";

    imports = [
        ../common.nix
        ../modules/kde.nix
        ../modules/ly.nix
        ../modules/firefox.nix
        ../modules/pipewire.nix
        ../modules/ghostty.nix
        ../modules/theming.nix
        ../modules/gaming.nix
        ../modules/cad.nix
        ../modules/bluetooth.nix
        ../modules/imv.nix
    ];
}
