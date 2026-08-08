{ ... }:
{
    imports = [
        ./boot.nix
    ];

    boot.loader.limine = {
        enable = true;
        maxGenerations = 5;
    };
}
