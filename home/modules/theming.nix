{ pkgs, ... }:
{
    stylix.targets = {
        ghostty.enable = false;
        hyprland.enable = false;
        waybar.enable = false;
    };

    dconf.settings = {
        "org/gnome/desktop/wm/preferences" = {
            button-layout = "appmenu:minimize,maximize,close";
        };
    };
}

