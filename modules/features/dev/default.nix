{inputs, moduleWithSystem, ...}: {
    flake.nixosModules.dev = moduleWithSystem({pkgs, self', ...}: {
        environment.systemPackages = [
            self'.packages.vscodium
            pkgs.neovim
            pkgs.python3
        ];
    });

    perSystem = {system, ...}: let
        pkgs = import inputs.nixpkgs {
            inherit system;
            overlays = [ inputs.nix-vscode-extensions.overlays.default ];
        };

        settingsJson = ./codium/settings.json;
        keybindsJson = ./codium/keybindings.json;

        codiumWithExts = pkgs.vscode-with-extensions.override {
            vscode = pkgs.vscodium;
            vscodeExtensions = with pkgs.nix-vscode-extensions.open-vsx; [
                asvetliakov.vscode-neovim
                catppuccin.catppuccin-vsc
                jnoortheen.nix-ide
                ms-python.debugpy
                ms-python.python
                ms-python.vscode-python-envs
                mvllow.rose-pine
                vscode-icons-team.vscode-icons
            ];
        };
    in {
        packages.vscodium = inputs.wrappers.lib.wrapPackage {
            inherit pkgs;
            package = codiumWithExts;

            runShell = [
                ''
                    DATA_DIR="''${HOME}/.local/state/vscodium-nix"
                    mkdir -p "$DATA_DIR/User"
                    ln -sfn ${settingsJson} "$DATA_DIR/User/settings.json"
                    ln -sfn ${keybindsJson} "$DATA_DIR/User/keybindings.json"

                    exec ${codiumWithExts}/bin/codium \
                        --user-data-dir "$DATA_DIR" "$@"
                ''
            ];
        };
    };
}