# Import SSH_AUTH_SOCK into systemd user environment
systemctl --user import-environment SSH_AUTH_SOCK

# Have OpenSSH support XDG base directories
alias scp="scp -F ${XDG_CONFIG_HOME}/ssh/config"
alias sftp="sftp -F ${XDG_CONFIG_HOME}/ssh/config"
alias ssh="ssh -F ${XDG_CONFIG_HOME}/ssh/config"
alias sshfs="sshfs -F ${XDG_CONFIG_HOME}/ssh/config"

function () {
    local -r known_hosts_file=${XDG_STATE_HOME}/ssh/known_hosts
    [[ -r "${known_hosts_file}" ]] || return

    while read -r line; do
        local fqdn="${line%%[ ,]*}"

        if [[ "${fqdn}" =~ ":[0-9]+$" ]]; then
            fqdn="${${fqdn%%:*}:1:-1}"
        fi

        eval "function ${fqdn}() {"'
                local -a opts
                until [[ $"${1:---}" == $"--" ]] {
                    opts+=("${1}")
                    shift
                }
                [[ -n "${1:-}" ]] && shift
                local args="$*"
                '"ssh ${port_arg:-}\${opts} ${fqdn} \${args}
              }"
        compdef ${fqdn}=ssh
    done < "${known_hosts_file}"
}
