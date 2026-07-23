{ pkgs, ... }:
{
    users.users.mightid = {
        isNormalUser = true;
        extraGroups = [ "wheel" "dialout" ];
        shell = pkgs.zsh;
    };

    programs.zsh.enable = true;
}
