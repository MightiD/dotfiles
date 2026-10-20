{...}: {
    flake.nixosModules.system = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            git
        ];

        imports = [
            /etc/nixos/hardware-configuration.nix
        ];
    };
}
