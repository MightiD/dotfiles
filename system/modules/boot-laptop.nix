{ ... }:
{
    imports = [
        ./boot.nix
    ];

    boot.loader.grub = {
        enable = true;
        efiSupport = true;
        efiInstallAsRemovable = true;
        configurationLimit = 5;
    };
}
