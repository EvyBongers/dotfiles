if [[ ${+commands[virtualenvwrapper_lazy.sh]} ]]; then
    source "${commands[virtualenvwrapper_lazy.sh]}"

    # Support for bash
    PROMPT_COMMAND='prompt'

    precmd() { eval "$PROMPT_COMMAND" }

    function prompt()
    {
        if [ "$PWD" != "$MYOLDPWD" ]; then
            MYOLDPWD="$PWD"
            test -f .venv && workon `cat .venv`
        fi
    }
fi
