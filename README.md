# Dotfiles

These are my dotfiles, not much more to say.

## Requirements

No additional software is needed to make use of these dotfiles. However, there
are a few zsh extensions that will cause warnings if the related packages are
not installed.

- `EDITOR` is set to `vim`
- `PAGER` is set to `less`
- `gbt` is used to render the zsh prompt if it's installed

**ohmyzsh plugins**

- gpg-agent plugin needs gnupg installed
- virtualenvwrapper plugin needs the python module `virtualenvwrapper` installed

**gbt**

- In order for UTF-8 characters to render, DejaVuSansMono Nerd font is required
  (See https://github.com/jtyr/gbt#fonts-and-colors for more information)

_Required software for graphical environments listed below_

## Installation

```bash
alias home="git --work-tree=${HOME} --git-dir=${HOME}/.files.git";
home init && \
home remote add origin https://github.com/EvyBongers/dotfiles.git && \
home fetch && \
home reset --hard origin/main && \
home branch -m main && \
home submodule update --recursive --init && \
home branch --set-upstream-to=origin/main main && \
home remote set-url --push origin git@github.com:EvyBongers/dotfiles.git
```

## Graphical environments

_I recently switched from X11/i3 to Wayland/Sway. Configuration for i3wm will
probably be around for some time, but won't see many updates._

To make use of the window manager features, some additional software needs to
be installed as well.

| **i3**        | **sway**             |
| ------------- | -------------------- |
| - dmenu       | - wofi               |
| - py3status   | - waybar             |
| - xsecurelock | - swaylock           |
| - xss-lock    | - loginctl (systemd) |
| - xset        |                      |
| - flameshot   | - grim               |
|               | - jq                 |
|               | - slurp              |
|               | - swappy             |
| - xmodmap     |                      |

The following software is configured for both window managers

- pactl (PulseAudio/libpulse)
- brightnessctl
- playerctl
- blueman-applet (blueman)
- nm-applet
- keybase
- Emote
