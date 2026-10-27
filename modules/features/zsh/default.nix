{inputs, moduleWithSystem, ...}: {
    flake.nixosModules.zsh = moduleWithSystem({pkgs, self', ...}: {
        nixpkgs.overlays = [
            (final: prev: {
                zsh = self'.packages.zsh;
            })
        ];

        programs.zsh = {
            enable = true;
        };
    });

    perSystem = {pkgs, lib, ...}: {
        packages.zsh = inputs.wrappers.wrappers.zsh.wrap {
            inherit pkgs;
            zshAliases = {
                ls = "${lib.getExe pkgs.eza} --icons -a";
                l = "ls -lah";
                vim = lib.getExe pkgs.neovim;
                cat = lib.getExe pkgs.bat;
                ip = "ip -c";
                year = "cal -my";
                uefi = "systemctl reboot --firmware-setup";
            };

            zshrc = {
                path = ./zshrc;

                content = ''
                    source ${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
                    source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
                '';
            };
        };
    };
}
