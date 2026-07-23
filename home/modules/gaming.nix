{ pkgs, ... }:
{
    home.packages = [
        (pkgs.writeShellScriptBin "steam-bpm" ''
            sh -c '
                pkill -15 steam
                while pgrep steam > /dev/null; do
                    sleep 0.1
                done

                ${pkgs.gamescope}/bin/gamescope \
                    -W 1920 \
                    -H 1080 \
                    -r 60 \
                    -f \
                    -- steam -gamepadui
                '
        '')
    ];

    xdg.desktopEntries.steamBPM = {
        name = "Steam Big Picture Mode";
        exec = "steam-bpm";
        type = "Application";
        icon = "steam";
        categories = [ "Game" ];
        terminal = false;
    };
}
