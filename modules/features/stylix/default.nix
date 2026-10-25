{inputs, moduleWithSystem, ...}: {
    flake.nixosModules.stylix = moduleWithSystem({pkgs, ...}: {
        imports = [
            inputs.stylix.nixosModules.stylix
        ];

        stylix = {
            enable = true;
            autoEnable = true;

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
        };

        programs.dconf.enable = true;
    });
}
