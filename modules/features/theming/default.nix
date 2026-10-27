{inputs, moduleWithSystem, ...}: {
    flake.nixosModules.theming = moduleWithSystem({pkgs, ...}: {
        imports = [
            inputs.stylix.nixosModules.stylix
        ];

        stylix = {
            enable = true;
            autoEnable = true;
            polarity = "dark";

            base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-frappe.yaml";

            cursor = {
                package = pkgs.rose-pine-hyprcursor;
                name = "rose-pine-hyprcursor";
                size = 12;
            };

            icons = {
                enable = true;
                package = pkgs.papirus-icon-theme;
                dark = "Papirus-Dark";
            };

            fonts = {
                monospace = {
                    package = pkgs.nerd-fonts.jetbrains-mono;
                    name = "JetBrainsMono Nerd Font";
                };
                sansSerif = {
                    package = pkgs.inter;
                    name = "Inter";
                };
                serif = {
                    package = pkgs.noto-fonts;
                    name = "Noto Serif";
                };
                emoji = {
                    package = pkgs.noto-fonts-color-emoji;
                    name = "Noto Color Emoji";
                };
            };
        };

        fonts.packages = with pkgs; [
            noto-fonts-cjk-sans
            liberation_ttf
            dejavu_fonts
            font-awesome
            nerd-fonts.fira-code
        ];

        programs.dconf.enable = true;
    });
}
