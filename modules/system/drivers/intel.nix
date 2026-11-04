{...}: {
    flake.nixosModules.intelDrivers = {pkgs, ...}: {
        hardware.enableRedistributableFirmware = true;

        hardware.graphics = {
            enable = true;
            enable32Bit = true;
            extraPackages = with pkgs; [
                intel-media-driver
                intel-compute-runtime
            ];
        };

        environment.systemPackages = with pkgs; [
            libva-utils
            intel-gpu-tools
        ];

        environment.sessionVariables.LIBVA_DRIVER_NAME = "iHD";
    };
}
