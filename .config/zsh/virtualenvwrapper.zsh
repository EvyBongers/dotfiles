if command -v virtualenvwrapper.sh &>/dev/null; then
    export WORKON_HOME="${XDG_DATA_HOME}/virtualenvs"
    export PROJECT_HOME="${HOME}/git"
    export VIRTUALENVWRAPPER_PYTHON=$(command -v python3)
    export VIRTUALENVWRAPPER_SCRIPT=$(command -v virtualenvwrapper.sh)
    source "${VIRTUALENVWRAPPER_SCRIPT}"

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
