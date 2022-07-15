set -a
for file in "${XDG_CONFIG_HOME}/zsh/env.d"/*; do
    source "${file}"
done
set +a
