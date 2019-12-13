# Requires gbt and Nerd fonts to be installed
# Arch:
# $ yay -S aur/gbt aur/nerd-fonts-complete
#
# MacOS:
# $ brew tap jtyr/repo
# $ brew install gbt
# $ brew tap homebrew/cask-fonts
# $ brew cask install font-hack-nerd-font-mono

if command -v gbt &>/dev/null; then
    PROMPT='$(gbt $?)'

    # Tell python virtualenv to leave the prompt alone
    export VIRTUAL_ENV_DISABLE_PROMPT='1'

    export GBT_CARS='Status, Os, Hostname, Dir, Kubectl, Git, PyVirtEnv, Sign'
fi
