{...}: {
    flake.nixosModules.bigNixHostConfiguration = {pkgs, ...}: {
        networking.hostName = "bigNix";
    };
}
