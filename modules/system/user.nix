{...}: {
    flake.nixosModules.user = {pkgs, ...}: {
        users.users.mightid = {
            isNormalUser = true;
            initialPassword = "password";
            shell = pkgs.zsh;
            extraGroups = [
                "root"
                "wheel"
                "dialout"
            ];
        };
    };
}
