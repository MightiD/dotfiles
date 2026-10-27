{inputs, moduleWithSystem, ...}: {
    flake.nixosModules.common = moduleWithSystem({pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            git
            tree
            wget
            bind
            netcat
            btop
            dysk
            ripgrep
            fd
        ];
    });
}
