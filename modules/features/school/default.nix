{inputs, moduleWithSystem, ...}: {
    flake.nixosModules.school = moduleWithSystem({pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            rnote
            obsidian
        ];
    });
}
