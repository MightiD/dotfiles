{...}: {
    flake.nixosModules.time = {lib, ...}: {
        time.timeZone = "Europe/London";
        services.timesyncd.enable = lib.mkDefault true;
    };
}
