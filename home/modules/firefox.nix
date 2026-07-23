{ inputs, ... }:
{
    programs.firefox = {
        enable = true;

        profiles.mightid = {
            isDefault = true;

            settings = {
                "browser.urlbar.suggest.bookmark" = false;
                "browser.urlbar.suggest.engines" = false;
                "browser.urlbar.suggest.openpage" = false;
                "browser.urlbar.suggest.topsites" = false;
                "browser.newtabpage.activity-stream.showSponsored" = false;
                "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
                "sidebar.revamp" = true;
                "sidebar.verticalTabs" = true;
                "sidebar.verticalTabs.dragToPinPromo.dismissed" = true;
                "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
            };

            search = {
                default = "ddg";
                privateDefault = "ddg";
            };

            extensions = {
                packages = with inputs.firefox-addons.packages."x86_64-linux"; [
                    ublock-origin
                    vimium
                    darkreader
                ];
            };
        };
    };
}
