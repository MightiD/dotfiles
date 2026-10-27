{...}: {
    flake.nixosModules.bootloader = {pkgs, ...}: {
        boot = {
            loader = {
                timeout = 2;
                efi = {
                    canTouchEfiVariables = true;
                };
                grub = {
                    efiSupport = true;
                    device = "nodev";
                };
            };

            plymouth = {
                enable = true;
                theme = "bgrt";
            };

            initrd.verbose = false;
            consoleLogLevel = 0;

            kernelParams = [
                "quiet"
                "splash"
                "udev.log_priority=3"
                "rd.systemd.show_status=auto"
                "vt.global_cursor_default=0"
            ];

            kernelPackages = pkgs.linuxPackages_latest;
        };
    };
}
