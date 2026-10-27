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
            time
        ];
    in {
        nix.settings.experimental-features = ["nix-command" "flakes"];
        nixpkgs.config.allowUnfree = true;

        system.stateVersion = "26.05";

        imports = [
            /etc/nixos/hardware-configuration.nix
        ] ++ modules;
    };
}
