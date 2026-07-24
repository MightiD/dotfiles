{ pkgs, ... }:
{
    nix.settings.experimental-features = ["nix-command" "flakes"];
    nixpkgs.config.allowUnfree = true;
    
    imports = [
        /etc/nixos/hardware-configuration.nix
        ./modules/users.nix
        ./modules/locale.nix
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

    time.timeZone = "Europe/London";
    services.timesyncd.enable = true;

    system.stateVersion = "26.05";
}
