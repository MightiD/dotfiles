{ pkgs, ... }:
{
    boot.kernelParams = [
        "quiet"
        "splash"
        "console=/dev/null"
    ];

    boot.kernelPackages = pkgs.linuxPackages_latest;
}
