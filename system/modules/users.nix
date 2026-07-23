{ pkgs, ... }:
{
    users.users.mightid = {
        isNormalUser = true;
        extraGroups = [ "wheel" ];
        shell = pkgs.zsh;
    };

    programs.zsh.enable = true;
}
