{ pkgs, ... }:
{
    boot.kernelParams = [
        "quiet"
        "splash"
        "console=/dev/null"
    ];

    boot.kernelPackages = pkgs.linuxPackages_latest;

    boot.loader.efi.canTouchEfiVariables = true;

    boot.loader.limine = {
        efiSupport = true;
        enable = true;
        maxGenerations = 5;
    };
}
