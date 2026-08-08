{ ... }:
{
    programs.ghostty = {
        enable = true;
        settings = {
            font-size = 11;
            font-family = "Miracode";
            background-opacity = 0.8;
            background = "000000";
            confirm-close-surface = false;
            theme = "Gruvbox Material Dark";
            window-inherit-working-directory = false;
            working-directory = "~/";
        };
    };
}
