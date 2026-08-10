{ pkgs, ... }:
{
    boot.kernelParams = [
        "quiet"
        "splash"
        "console=/dev/null"
    ];

    boot.kernelPackages = pkgs.linuxPackages_latest;

    boot.loader.limine = {
        enable = true;
        maxGenerations = 5;
    };
}
