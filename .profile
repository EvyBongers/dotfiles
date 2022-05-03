umask 022

export LANG="en_US.UTF-8"

set -a
eval "$(/usr/lib/systemd/user-environment-generators/30-systemd-environment-d-generator)"
set +a
