{ ... }:
{
    networking.hostName = "nixos";

    imports = [
        ../common.nix
        ../modules/hypr.nix
        ../modules/firefox.nix
        ../modules/pipewire.nix
        ../modules/ghostty.nix
        ../modules/file-manager.nix
        ../modules/theming.nix
        ../modules/gaming.nix
        ../modules/cad.nix
    ];
}
