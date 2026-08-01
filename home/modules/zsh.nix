{ pkgs, ... }:
{
    programs.zsh = {
        enable = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        plugins = [
            {
                name = "zsh-nix-shell";
                file = "nix-shell.plugin.zsh";
                src = pkgs.fetchFromGitHub {
                    owner = "chisui";
                    repo = "zsh-nix-shell";
                    rev = "v0.8.0";
                    sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
                };
            }
        ];
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
            nrs() {
                sudo nixos-rebuild switch --impure --flake .#$1
            }
        '';
        sessionVariables = {
            EDITOR = "nvim";
            VISUAL = "nvim";
        };
    };
}
