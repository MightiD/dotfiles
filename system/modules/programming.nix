{ pkgs, ... }:
{
    programs.neovim.defaultEditor = true;

    environment.systemPackages = with pkgs; [
        lazygit
        neovim
        tmux
    ];
}
