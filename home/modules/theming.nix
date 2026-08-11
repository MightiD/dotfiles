{ pkgs, lib, host, ... }:
{
    stylix.targets = {
        ghostty.enable = false;
        hyprland.enable = false;
        waybar.enable = false;
    };

    dconf.settings = lib.mkMerge [
        (lib.mkIf (host == "bigNix") {
            "org/gnome/desktop/wm/preferences" = {
                button-layout = "appmenu:";
            };
        })
        (lib.mkIf (host == "miniNix") {
            "org/gnome/desktop/wm/preferences" = {
                button-layout = "appmenu:minimize,maximize,close";
            };
        })
    ];
}

