{ pkgs, ... }:
{
    stylix.targets = {
        ghostty.enable = false;
        hyprland.enable = false;
        waybar.enable = false;
        firefox.profileNames = [ "mightid" ];
    };
}

