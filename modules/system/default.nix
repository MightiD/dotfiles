{self, ...}: {
    flake.nixosModules.system = {...}: let
        modules = with self.nixosModules; [
            user
            networking
            bootloader
            zsh
        ];
    in {
        imports = [
            /etc/nixos/hardware-configuration.nix
        ] ++ modules;
    };
}
