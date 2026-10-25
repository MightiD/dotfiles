{self, ...}: {
    flake.nixosModules.system = {...}: let
        modules = with self.nixosModules; [
            user
            networking
            locale
            bootloader
            zsh
            syncthing
        ];
    in {
        imports = [
            /etc/nixos/hardware-configuration.nix
        ] ++ modules;
    };
}
