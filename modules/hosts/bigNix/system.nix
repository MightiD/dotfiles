{...}: {
    flake.nixosModules.bigNixHostConfiguration = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            git
        ];

        imports = [
            /etc/nixos/hardware-configuration.nix
        ];
    };
}
