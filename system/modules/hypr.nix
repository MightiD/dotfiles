{ pkgs, ... }:
{
    services.libinput.enable = true;

    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
    };

    environment.loginShellInit = ''
        if [ "$(tty)" = "/dev/tty1" ]; then
            start-hyprland
        fi
    '';

    environment.systemPackages = with pkgs; [
        hyprshot
        wl-clipboard
        awww
        fuzzel
        waybar
    ];
}
