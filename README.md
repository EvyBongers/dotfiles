# Dotfiles

To install:
```bash
alias home="git --work-tree=${HOME} --git-dir=${HOME}/.files.git"; \
home init && \
home remote add origin https://gitlab.com/EvyBongers/dotfiles.git && \
home pull --recurse-submodules origin master && \
home remote set-url --push origin git@gitlab.com:EvyBongers/dotfiles.git
```
