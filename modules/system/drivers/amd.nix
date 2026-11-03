{...}: {
    flake.nixosModules.amdDrivers = {pkgs, ...}: {
        hardware.enableRedistributableFirmware = true;

        boot.initrd.kernelModules = [ "amdgpu" ];

        hardware.graphics = {
            enable = true;
            enable32Bit = true;
            # extraPackages = with pkgs; [
            #     rocmPackages.clr.icd
            # ];
        };

        environment.systemPackages = with pkgs; [
            libva-utils
            nvtop
        ];

        environment.sessionVariables.LIBVA_DRIVER_NAME = "radeonsi";
    };
}
