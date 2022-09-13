umask 022

export LANG="en_GB.UTF-8"

set -a
source /dev/fd/0 <<EOF
$(/usr/lib/systemd/user-environment-generators/30-systemd-environment-d-generator)
EOF
set +a

if [ ! -d "${XDG_RUNTIME_DIR:=/tmp/${UID}-runtime-dir}" ]; then
    mkdir -p "${XDG_RUNTIME_DIR}"
    chmod 0700 "${XDG_RUNTIME_DIR}"
    export XDG_RUNTIME_DIR
fi
