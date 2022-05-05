umask 022

export LANG="en_US.UTF-8"

set -a
source /dev/fd/0 <<EOF
$(/usr/lib/systemd/user-environment-generators/30-systemd-environment-d-generator)
EOF
set +a
