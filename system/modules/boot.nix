{ pkgs, ... }:
{
    boot.loader = {
        limine.enable = true;
        limine.maxGenerations = 5;
        # systemd-boot.enable = true;
        # systemd-boot.configurationLimit = 5;
        efi.canTouchEfiVariables = true;
    };

    boot.kernelParams = [
        "quiet"
        "splash"
        "console=/dev/null"
    ];

    boot.kernelPackages = pkgs.linuxPackages_latest;
}
