{ pkgs, ... }:
{
    services.avahi = {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
    };

    services.printing = {
        enable = true;
        cups-pdf.enable = true;
        drivers = with pkgs; [
            cups-filters
            cups-browsed
        ];
    };
}
