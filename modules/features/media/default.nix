{inputs, moduleWithSystem, ...}: {
    flake.nixosModules.media = moduleWithSystem({pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            imv
            mpv
        ];
    });
}
