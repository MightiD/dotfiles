{...}: {
    flake.nixosModules.homelabHostConfiguration = {pkgs, ...}: {
        networking.hostName = "homelab";
    };
}
