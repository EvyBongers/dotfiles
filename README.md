# Dotfiles

To install:
```bash
alias home="git --work-tree=${HOME} --git-dir=${HOME}/.files.git"; \
home init && \
home remote add origin https://gitlab.com/EvyBongers/dotfiles.git && \
home pull origin master && \
home submodule update --recursive --init && \
home branch --set-upstream-to=origin/master master
home remote set-url --push origin git@gitlab.com:EvyBongers/dotfiles.git
```
