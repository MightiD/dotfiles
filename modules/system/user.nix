{...}: {
    flake.nixosModules.user = {pkgs, ...}: {
        users.users.mightid = {
            isNormalUser = true;
            initialPassword = "password";
            extraGroups = [
                "root"
                "wheel"
                "dialout"
            ];
        };
    };
}
