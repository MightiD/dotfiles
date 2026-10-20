{...}: {
    flake.nixosModules.miniNixHostConfiguration = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            fastfetch
        ];
    };
}
