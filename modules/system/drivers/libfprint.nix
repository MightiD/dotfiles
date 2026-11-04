# modules/canvasbio-cb2000.nix
{moduleWithSystem, ...}: {
    perSystem = {pkgs, ...}: {
        packages.canvasbio-cb2000-tod = pkgs.stdenv.mkDerivation {
            pname = "libfprint-tod-canvasbio-cb2000";
            version = "1.0.3";

            src = pkgs.fetchFromGitHub {
                owner = "kpagnussat";
                repo = "canvasbio-cb2000";
                rev = "25e8b8a";
                hash = "sha256-aaEnZmI0rm7q8oAEdvnizBqAEnIdHZK1sWTBAsfCXT8=";
            };

            nativeBuildInputs = [pkgs.meson pkgs.ninja pkgs.pkg-config];
            buildInputs = [pkgs.libfprint-tod pkgs.glib pkgs.libgudev pkgs.gusb];

            postPatch = ''
                substituteInPlace meson.build \
                  --replace-fail "tod_driversdir = tod_dep.get_variable(pkgconfig: 'tod_driversdir')" \
                                 "tod_driversdir = 'lib/libfprint-2/tod-1'" \
                  --replace-fail "core_deps = [meson.get_compiler('c').find_library('m', required: false)]" \
                                 "core_deps = [dependency('glib-2.0'), dependency('gusb'), meson.get_compiler('c').find_library('m', required: false)]" \
                  --replace-fail "c_args = ['-DCB2000_DRIVER_VERSION=" \
                                 "c_args = ['-I${pkgs.libfprint-tod}/include/libfprint-2', '-DCB2000_DRIVER_VERSION="
            '';

            doCheck = true;

            passthru.driverPath = "/lib/libfprint-2/tod-1";
        };
    };

    flake.nixosModules.fprint = moduleWithSystem ({self', ...}: {
        services.fprintd = {
            enable = true;
            tod = {
                enable = true;
                driver = self'.packages.canvasbio-cb2000-tod;
            };
        };
    });
}
