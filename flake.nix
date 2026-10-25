{
    description = "My NixOS Configuration";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

        flake-parts.url = "github:hercules-ci/flake-parts";
        import-tree.url = "github:vic/import-tree";
        wrappers.url = "github:nix-community/nix-wrapper-modules";

        stylix.url = "github:nix-community/stylix/release-26.05";
    };

    outputs = inputs:
        inputs.flake-parts.lib.mkFlake {
            inherit inputs;
        } (inputs.import-tree ./modules);
}
