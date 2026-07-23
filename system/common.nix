{ pkgs, ... }:
{
    nix.settings.experimental-features = ["nix-command" "flakes"];
    nixpkgs.config.allowUnfree = true;
    
    imports = [
        /etc/nixos/hardware-configuration.nix
        ./modules/boot.nix
        ./modules/users.nix
        ./modules/locale.nix
        ./modules/networking.nix
        ./modules/programming.nix
        ./modules/openssh.nix
    ];

    environment.systemPackages = with pkgs; [
        git
        tree
        wget
        bat
        tmux
        eza
        btop
        fastfetch
    ];

    services.getty.autologinUser = "mightid";

    system.stateVersion = "26.05";
}
