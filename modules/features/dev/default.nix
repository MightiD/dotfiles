{inputs, moduleWithSystem, ...}: {
    flake.nixosModules.dev = moduleWithSystem({pkgs, ...}: {
        environment.systemPackages = with pkgs; [
	    vscodium
	    neovim
        ];
    });
}
