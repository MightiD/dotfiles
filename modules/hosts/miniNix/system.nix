{...}: {
    flake.nixosModules.miniNixHostConfiguration = {pkgs, ...}: {
        networking.hostName = "miniNix";
    };
}
