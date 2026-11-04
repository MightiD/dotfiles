{inputs, moduleWithSystem, ...}: {
    flake.nixosModules.common = moduleWithSystem({pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            git
            lazygit
            tree
            wget
            binutils
            gcc
            gnumake
            man-pages
            man-pages-posix
            bind
            netcat
            btop
            dysk
            ripgrep
            fd
            unzip
        ];

        documentation.dev.enable = true;
    });
}
