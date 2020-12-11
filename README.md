# Dotfiles

To install:
```bash
alias home="git --work-tree=${HOME} --git-dir=${HOME}/.files.git";
home init && \
home remote add origin https://github.com/EvyBongers/dotfiles.git && \
home fetch && \
home reset --hard origin/main && \
home submodule update --recursive --init && \
home branch --set-upstream-to=origin/main main && \
home remote set-url --push origin git@github.com:EvyBongers/dotfiles.git
```
