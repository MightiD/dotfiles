{ ... }:
{
    home.username = "mightid";
    home.homeDirectory = "/home/mightid";
    home.stateVersion = "26.05";

    imports = [
        ./modules/zsh.nix
        ./modules/nvim.nix
        ./modules/fastfetch.nix
    ];
}
