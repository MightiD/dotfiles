{self, inputs, moduleWithSystem, ...}: {
    flake.nixosModules.theming-bigNix = moduleWithSystem({...}: {
        imports = with self.nixosModules; [
            theming
        ];

        programs.dconf.profiles.user.databases = [{
            settings = {
                "org/gnome/desktop/wm/preferences" = {
                    button-layout = "appmenu:";
                };
            };
        }];
    });
}
