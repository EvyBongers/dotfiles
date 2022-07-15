function lookup_host(){
    local host

    host="$1"
    if type getent &>/dev/null; then
        getent hosts "${pattern}" &>/dev/null
        return $?
    fi
    if type dscacheutil &>/dev/null; then
        dscacheutil -q host -a name "${host}" |grep -q 'ip_address:'
        return $?
    fi
    return 1
}

function test_ssh_host(){
    local pattern

    pattern="$1"
    if grep -Eq "^Host\\s+(\\w+\\*?\\s+)*\\b${pattern}\\b" "${XDG_CONFIG_HOME}/ssh/config" 2>/dev/null; then
        # Pattern found in ssh_config(5) config file
        return 0
    elif lookup_host "${pattern}" &>/dev/null; then
        # Pattern resolves to an ip
        if [[ ! ${+commands[nc]} ]]; then
            # Netcat wasn't found, try to connect
            return 0
        fi

        if nc -zw1 "${pattern}" 22 &>/dev/null; then
            # Port 22 is open
            return 0
        fi
    fi

    return 1
}

function command_not_found_handler(){
    local comm word1

    word1="$1"
    shift

    # Test number of arguments
    if [[ $# -eq 0 ]]; then
        # Single word, try to see if SSH could work
        if test_ssh_host "${word1}"; then
            comm="ssh ${word1}"
        fi
    else
        local opts=""
        while [[ $# -ge 1 ]]; do
            next_word="$1"
            shift
            if [[ $"${next_word}" != $"--" ]]; then
                opts="${opts}${opts:+ }$next_word"
            else
                break
            fi
        done
        local args="$*"

        if test_ssh_host "${word1}"; then
            comm="ssh"
            test -n "${opts-}" && comm="${comm} ${opts}"
            comm="${comm} ${word1}"
            test -n "${args-}" && comm="${comm} ${args}"
        fi
    fi

    if [[ -n "${comm}" ]]; then
        echo "${comm}"
        sleep 0.2
        eval "${comm}"
        return $?
    fi

    echo "-zsh: command not found: ${word1}"
    return 127
}
