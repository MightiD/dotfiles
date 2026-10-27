{self, ...}: {
    flake.nixosModules.system = {...}: let
        modules = with self.nixosModules; [
            common
            user
            networking
            locale
            bootloader
            zsh
            syncthing
        ];
    in {
        nixpkgs.config.allowUnfree = true;

        imports = [
            /etc/nixos/hardware-configuration.nix
        ] ++ modules;
    };
}
