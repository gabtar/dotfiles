# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import subprocess
import os

from libqtile import bar, layout, widget, qtile, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

mod = "mod4"
terminal = "alacritty"


# Colorscheme
one_dark = {
    "background": "363636",
    "foreground": "abb2bf",
    "black":      "5c6370",
    "red":        "e06c75",
    "green":      "98c379",
    "yellow":     "d19a66",
    "blue":       "61afef",
    "magenta":    "c678dd",
    "cyan":       "89c0d0",
    "white":      "828791"
}
theme = one_dark

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod],
        "space",
        lazy.layout.next(),
        desc="Move window focus to other window"),

    Key([mod], "r", lazy.spawn("rofi -show combi"), desc="spawn rofi"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"],
        "h",
        lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"],
        "j",
        lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"],
        "h",
        lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"],
        "l",
        lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"],
        "j",
        lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "shift", "control"], "h", lazy.layout.swap_column_left()),
    Key([mod, "shift", "control"], "l", lazy.layout.swap_column_right()),
    Key([mod, "shift"], "space", lazy.layout.flip()),
    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod, "shift"],
        "r",
        lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"),
    # Volume controls
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer set Master 3%+")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer set Master 3%-")),
    Key([], "XF86AudioMute", lazy.spawn("amixer set Master toggle")),
    # Brightness controls
    Key([], "XF86MonBrightnessUp", lazy.spawn("light -A 5")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("light -U 5")),
]

groups = [
    Group("1", label="", layout="monadtall"),
    Group("2", label="", layout="monadtall"),
    Group("3", label="󰖟", layout="max"),
    Group("4", label="", layout="monadtall"),
    Group("5", label="", layout="max"),
]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod],
            i.name,
            lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        Key([mod], "Right", lazy.screen.next_group(),
            desc="Switch to next group"),

        Key([mod], "Left", lazy.screen.prev_group(),
            desc="Switch to previous group"),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"],
            i.name,
            lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])

layout_defaults = {
    "border_width": 2,
    "border_focus": theme["cyan"],
    "border_normal": theme["black"],
}

layouts = [
    layout.Columns(**layout_defaults),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="Monoid NF",
    fontsize=12,
    padding=6,
)
extension_defaults = widget_defaults.copy()

# Helper functions to build panel elements


def left_arrow(background, foreground): return widget.TextBox(
    font="Monoid NF",
    text=" ",
    fontsize=26,
    background=background,
    foreground=foreground,
    padding=0,
)


def separator(padding, background): return widget.TextBox(
    padding=padding,
    linewidth=0,
    background=background
)

# Custom widgets


class MyVolume(widget.Volume):
    def _configure(self, qtile, bar):
        widget.Volume._configure(self, qtile, bar)
        self.volume = self.get_volume()
        if self.volume <= 0:
            self.text = ' '
        elif self.volume <= 15:
            self.text = ' {}%'.format(self.volume)
        elif self.volume < 50:
            self.text = ' {}%'.format(self.volume)
        else:
            self.text = ' {}%'.format(self.volume)

    def _update_drawer(self, wob=False):
        if self.volume <= 0:
            self.text = ' '
        elif self.volume <= 15:
            self.text = ' {}%'.format(self.volume)
        elif self.volume < 50:
            self.text = ' {}%'.format(self.volume)
        else:
            self.text = ' {}%'.format(self.volume)
        self.draw()

        if wob:
            with open(self.wob, 'a') as f:
                f.write(str(self.volume) + "\n")


screens = [
    Screen(
        top=bar.Bar(
            [
                separator(padding=1, background=theme["black"]),
                widget.Image(
                    filename='~/.config/qtile/python-logo.png',
                    margin=5, background=theme['black'],
                    mouse_callbacks={
                        'Button1': lambda: qtile.cmd_spawn("rofi -show combi")}
                ),
                left_arrow(
                    foreground=theme['background'], background=theme['black']),
                widget.GroupBox(
                    fontsize=16,
                    font="Monoid NF",
                    background=theme['background'],
                    highlight_method="line",
                    highlight_color=theme["background"],
                    this_current_screen_border=theme["magenta"],
                    block_highlight_text_color=theme["magenta"],
                    inactive=theme["white"],
                    borderwidth=3,
                    padding_x=10,
                    padding_y=3,
                    use_mouse_wheel=True,
                ),
                widget.Prompt(),
                widget.WindowName(max_chars=30, font="Sans bold"),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                # widget.StatusNotifier(),
                widget.CPU(
                    foreground=theme['cyan'],
                    background=theme['background'],
                    format='{load_percent: .0f}%',
                    update_interval=2
                ),
                widget.Memory(
                    foreground=theme['cyan'],
                    background=theme['background'],
                    format='{MemPercent: .0f} %',
                    update_interval=2
                ),
                separator(padding=2, background=theme["background"]),
                MyVolume(
                    foreground=theme['magenta'],
                    background=theme['background'],
                    mouse_callbacks={
                        'Button1': lambda: qtile.cmd_spawn("pavucontrol")},
                ),
                widget.Backlight(
                    backlight_name="intel_backlight",
                    fmt=" {}",
                    step=5,
                    foreground=theme['magenta'],
                    background=theme['background'],
                    change_command="light -S {0}"
                ),
                widget.Battery(
                    foreground=theme['magenta'],
                    background=theme['background'],
                    format=" {percent:2.0%}",
                    show_short_text=False
                ),
                widget.Systray(),
                widget.Clock(format="  %I:%M",
                             background=theme['background'],
                             foreground=theme['green']),
                left_arrow(
                    foreground=theme['green'], background=theme['background']),
                widget.CurrentLayoutIcon(
                    background=theme["green"],
                    scale=0.6,
                    padding=1,
                ),
                left_arrow(foreground=theme['red'],
                           background=theme['green']),
                widget.TextBox(
                    text=' ',
                    mouse_callbacks={
                        'Button1':
                        lambda: qtile.cmd_spawn(os.path.expanduser(
                            '~/.config/rofi/powermenu.sh'))
                    },
                    foreground=theme['black'],
                    background=theme['red']
                )
            ],
            28,
            background=theme["background"],
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"


@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.Popen([home])
