{ ... }:
{
    programs.zsh = {
        enable = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        oh-my-zsh = {
            enable = true;
            theme = "garyblessington";
            plugins = [ "git" ];
        };
        shellAliases = {
            ls = "eza -a --icons";
            year = "cal -my";
            ip = "ip -c";
            vim = "nvim";
            uefi = "systemctl reboot --firmware-setup";
        };
        initContent = ''
            open() {
                nohup xdg-open "$@" > /dev/null 2>&1 &
            }
            bgcmd() {
                nohup "$@" > /dev/null 2>&1 &
            }
        '';
        sessionVariables = {
            EDITOR = "nvim";
            VISUAL = "nvim";
        };
    };
}
