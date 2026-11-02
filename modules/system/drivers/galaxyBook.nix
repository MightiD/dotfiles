{...}: {
    flake.nixosModules.galaxyBook = {...}: {
        hardware.sensor.iio.enable = true;
    };
}
