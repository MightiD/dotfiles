{inputs, moduleWithSystem, ...}: {
    flake.nixosModules.keyboard = moduleWithSystem({pkgs, ...}: {
        hardware.keyboard.qmk.enable = true;

        environment.systemPackages = with pkgs; [
            vial
            qmk
        ];
    });
}
