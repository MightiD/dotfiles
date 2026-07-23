{ pkgs, ... }:
{
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

    fonts.packages = with pkgs; [
        fira-code
        fira-code-symbols
        miracode
    ];
}
