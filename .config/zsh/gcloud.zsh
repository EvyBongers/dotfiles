function gcloud() {
    declare cmd="$(whence -p gcloud)"
    while true; do
        case $1 in
            alpha|beta)
                cmd+=" ${1}"
                shift
                ;;
            compute)
                cmd+=" ${1}"
                shift
                ;;
            ssh)
                cmd+=" ${1} --ssh-key-file='${XDG_DATA_HOME}/ssh/ed25519_treehouse' --ssh-flag='-F ${XDG_CONFIG_HOME}/ssh/config'"
                shift
                ;;
            *)
                cmd+=" ${@}"
                break
        esac
    done

    eval "${cmd}"
}
