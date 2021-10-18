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

- In order for UTF-8 characters to render, Nerd fonts are required
  (See https://github.com/jtyr/gbt#fonts-and-colors for more information)

_Required software for graphical environments listed below_

## Installation

```bash
alias home="git --work-tree=${HOME} --git-dir=${HOME}/.files.git"

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

To make use of the window manager features, some additional software needs to
be installed as well.

- sway (SwayWM)
- waybar (status bar)
- swaylock (lock screen)
- wlogout (shutdown/restart helper)
- wofi (launcher)
- pactl (PulseAudio; audio controls)
- brightnessctl (screen brightness control)
- playerctl (media controls)
- blueman-applet (bluetooth status icon)
- nm-applet (network status icon)
- grim (screenshot utility)
  -- jq (filter visible windows)
  -- slurp (select region)
  -- swappy (screenshot editor)
- keybase
