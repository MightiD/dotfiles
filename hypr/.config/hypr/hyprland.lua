-- Monitors
hl.monitor({
    output = "HDMI-A-1",
    mode = "1920x1080@60",
    position = "0x0",
    scale = 1,
})

hl.monitor({
    output = "DP-1",
    mode = "1920x1080@60",
    position = "1920x0",
    scale = 1,
})

hl.monitor({
    output = "HDMI-A-2",
    mode = "1920x1080@60",
    position = "3840x-444",
    scale = 1,
    transform = 3,
})


-- Plugins
local hs = require("plugins/hyprsplit")
hs.config({ num_workspaces = 10 })


-- Apps
local terminal =       "kitty"
local fileManager = "pcmanfm-qt"
local menu =           "fuzzel"
local browser =        "firefox"
local screenshot =     "hyprshot -m region output --clipboard-only --freeze"
local satty =          "grim -g \"$(slurp)\" - | satty -f -"


-- Autostart
hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("swaync")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme \"Breeze-Dark\"")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme \"prefer-dark\"")
    hl.exec_cmd("hyprctl reload")
    hl.dsp.focus({ monitor="DP-1" })
end)


-- Env Vars
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_SIZE", "24")
hl.env("GTK_THEME", "Breeze-Dark")
hl.env("GTK_APPLICATION_PREFER_DARK_THEME", "1")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("XWAYLAND_FORCE", "1")


-- Look and Feel
hl.config({
    general = {
        gaps_in = 1,
        gaps_out = 1,
        border_size = 1,

        col = {
            active_border = {
                colors = { "rgb(b5cdd7)" }
            },
        },

        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },

    decoration = {
        rounding = 2,
        rounding_power = 10,
    },
    animations = { enabled = false },

    dwindle = { preserve_split = true },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
    },
})


-- Input

hl.config({
    input = {
        kb_layout = "gb",
        kb_options = "caps:escape",
        numlock_by_default = true,

        follow_mouse = 1,
    },
})


-- Keybinds
local mainMod = "SUPER"

-- Apps
hl.bind(mainMod .. "+ tab",       hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. "+ E",         hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. "+ R",         hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. "+ B",         hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. "+ M",         hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. "+ SHIFT + S", hl.dsp.exec_cmd(screenshot))
hl.bind(mainMod .. "+ SHIFT + ALT + S", hl.dsp.exec_cmd(satty))

-- Hypr functions
hl.bind(mainMod .. "+ Q",         hl.dsp.window.close())
hl.bind(mainMod .. "+ V",         hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. "+ S",         hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. "+ F",         hl.dsp.window.fullscreen({ mode="maximized", action = "toggle" }))
hl.bind(mainMod .. "+ SHIFT + F", hl.dsp.window.fullscreen({ action = "toggle" }))

-- Navigation
hl.bind(mainMod .. "+ H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. "+ L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. "+ K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. "+ J", hl.dsp.focus({ direction = "down" }))

-- Window Movement
hl.bind(mainMod .. "+ SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. "+ SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. "+ SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. "+ SHIFT + J", hl.dsp.window.move({ direction = "down" }))

hl.bind(mainMod .. "+ mouse:272", hl.dsp.window.drag(), { mouse = true })

-- Workspace Movement
hl.bind(mainMod .. "+ CONTROL + K",         hs.dsp.focus({ workspace = "r+1" }))
hl.bind(mainMod .. "+ CONTROL + J",         hs.dsp.focus({ workspace = "r-1" }))
hl.bind(mainMod .. "+ CONTROL + SHIFT + K", hs.dsp.window.move({ workspace = "r+1" }))
hl.bind(mainMod .. "+ CONTROL + SHIFT + J", hs.dsp.window.move({ workspace = "r-1" }))

-- Monitor Movement
hl.bind(mainMod .. "+ 1", hl.dsp.focus({ monitor="HDMI-A-1" }))
hl.bind(mainMod .. "+ 2", hl.dsp.focus({ monitor="DP-1" }))
hl.bind(mainMod .. "+ 3", hl.dsp.focus({ monitor="HDMI-A-2" }))

hl.bind(mainMod .. "+ SHIFT + 1", hl.dsp.window.move({ monitor="HDMI-A-1" }))
hl.bind(mainMod .. "+ SHIFT + 2", hl.dsp.window.move({ monitor="DP-1" }))
hl.bind(mainMod .. "+ SHIFT + 3", hl.dsp.window.move({ monitor="HDMI-A-2" }))

-- Resize Windows
hl.bind(mainMod .. "+ ALT + H", hl.dsp.window.resize({ x=-45, y=0,   relative=true }), { repeating = true })
hl.bind(mainMod .. "+ ALT + L", hl.dsp.window.resize({ x=45,  y=0,   relative=true }), { repeating = true })
hl.bind(mainMod .. "+ ALT + K", hl.dsp.window.resize({ x=0,   y=-45, relative=true }), { repeating = true })
hl.bind(mainMod .. "+ ALT + J", hl.dsp.window.resize({ x=0,   y=45,  relative=true }), { repeating = true })

hl.bind(mainMod .. "+ ALT + SHIFT + H", hl.dsp.window.resize({ x=-15, y=0,   relative=true }), { repeating = true })
hl.bind(mainMod .. "+ ALT + SHIFT + L", hl.dsp.window.resize({ x=15,  y=0,   relative=true }), { repeating = true })
hl.bind(mainMod .. "+ ALT + SHIFT + K", hl.dsp.window.resize({ x=0,   y=-15, relative=true }), { repeating = true })
hl.bind(mainMod .. "+ ALT + SHIFT + J", hl.dsp.window.resize({ x=0,   y=15,  relative=true }), { repeating = true })

hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- XF86 Functions
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })
hl.bind("XF86AudioNext",         hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause",        hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",         hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",         hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


-- Window + Workspace rules
hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

hl.window_rule({
    match = {
        title = "^(nsxiv)",
    },
    tile = true
})
