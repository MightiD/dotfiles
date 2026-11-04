{inputs, moduleWithSystem, ...}: {
    flake.nixosModules.gaming = moduleWithSystem({pkgs, ...}: {
        programs.steam.enable = true;

        environment.systemPackages = with pkgs; [
            gamescope
            prismlauncher
        ];
    });
}
