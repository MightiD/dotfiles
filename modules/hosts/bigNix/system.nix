{...}: {
    flake.nixosModules.bigNixHostConfiguration = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            git
        ];
    };
}
