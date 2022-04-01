# Have OpenSSH support XDG base directories
alias scp="scp -F ${XDG_CONFIG_HOME}/ssh/config"
alias sftp="sftp -F ${XDG_CONFIG_HOME}/ssh/config"
alias ssh="ssh -F ${XDG_CONFIG_HOME}/ssh/config"
alias sshfs="sshfs -F ${XDG_CONFIG_HOME}/ssh/config"

function () {
    local -r known_hosts_file=${XDG_STATE_HOME}/ssh/known_hosts
    if [[ ! -r "${known_hosts_file}" ]]; then
        return
    fi

    while read -r line; do
        local fqdn="$(echo "${line%%,*}" |cut -d' ' -f1)"
        if [[ "${fqdn}" == *:* ]]; then
            fqdn="${fqdn%%:*}"
        fi
        if [[ "${fqdn:0:1}" == "[" ]]; then
            fqdn="${fqdn:1:-1}"
        fi

        fn="function ${fqdn}() { ${pre_exec:-} local opts=\"\"; while [[ \$# -ge 1 ]]; do next_word=\"\$1\"; shift; if [[ \$\"\${next_word}\" != \$\"--\" ]]; then opts=\"\${opts}\${opts:+ }\$next_word\"; else break; fi; done; local args=\"\$*\"; comm=\"ssh \${opts} ${fqdn} \${args}\"; eval \"\${comm}\"; }"
        eval "${fn}"
    done < "${known_hosts_file}"
}
