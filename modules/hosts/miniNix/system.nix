{...}: {
    flake.nixosModules.miniNixHostConfiguration = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            fastfetch
        ];

        imports = [
            /etc/nixos/hardware-configuration.nix
        ];
    };
}
