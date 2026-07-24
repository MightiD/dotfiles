{ pkgs, ... }:
{
    boot.loader.efi.canTouchEfiVariables = true;

    boot.kernelParams = [
        "quiet"
        "splash"
        "console=/dev/null"
    ];

    boot.kernelPackages = pkgs.linuxPackages_latest;
}
