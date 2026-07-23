{ pkgs, ... }:
{
    programs.neovim.defaultEditor = true;

    environment.systemPackages = with pkgs; [
        neovim
        tmux
    ];
}
