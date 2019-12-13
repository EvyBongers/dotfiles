function () {
    local fqdn port_arg
    if [[ ! -r $HOME/.ssh/known_hosts ]]; then
        return
    fi

    while read -r line; do
        unset fqdn port_arg
        fqdn="$(echo "${line%%,*}" |cut -d' ' -f1)"
        if [[ "${fqdn}" == *:* ]]; then
            port_arg="-p ${fqdn##*:} "
            fqdn="${fqdn%%:*}"
        fi
        if [[ "${fqdn:0:1}" == "[" ]]; then
            fqdn="${fqdn:1:-1}"
        fi

        fn="function ${fqdn}() { ${pre_exec:-} local opts=\"\"; while [[ \$# -ge 1 ]]; do next_word=\"\$1\"; shift; if [[ \$\"\${next_word}\" != \$\"--\" ]]; then opts=\"\${opts}\${opts:+ }\$next_word\"; else break; fi; done; local args=\"\$*\"; comm=\"ssh ${port_arg:-}\${opts} ${fqdn} \${args}\"; eval \"\${comm}\"; }"
        eval "${fn}"
    done < $HOME/.ssh/known_hosts
}
