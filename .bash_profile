# define global aliases used elsewhere
alias gcd=cd

# go dir
# dir - directory to find and navigate to
# function will change directory to the shortest path to the named directory, printing the full path when found
go() {
    # unset args
    unset DIR
    unset HELP
    unset LIST

    # parse args
    while [[ $# -gt 0 ]]; do
        key="$1"
        case $key in
            -h|--help)  # print usage
                HELP=YES
                shift
                ;;
            -l|--list)  # list dir contents
                LIST=YES
                shift
                ;;
            -?|--*) # unknown option
                echo "go: $1: invalid option"
                HELP=YES
                break
                ;;
            *)  # directory
                DIR="$1"
                shift
                ;;
        esac
    done

    if [[ "${HELP}" ]]; then # display usage
        echo "usage: go [-h | --help] [-l | --list] [dir]"
        return
    fi
    
    # else find shortest path to directory
    if [[ -z "${DIR}" ]]; then
        dir="${HOME}"
    else
        dir="$(find ~ -iname ${DIR} | sort -n | head -n1)"
    fi

    curr="$(pwd)"
    if [[ "$dir" == "" ]]; then # couldn't find dir
        echo "go: ${DIR}: No such file or directory"
        return
    elif [[ "${dir}" == "${curr}" ]]; then # already in dir
        echo "go: Already in ${dir}"
    else # navigate to dir
        echo -e "$(tput setaf 1)leaving  $(tput sgr0)\c" && pwd
        gcd $dir
        echo -e "$(tput setaf 2)entering $(tput sgr0)\c" && pwd
    fi

    if [[ "${LIST}" ]]; then # list contents
        ls
    fi

    # unset varables
    unset DIR
    unset HELP
    unset LIST
}

# refresh
# function uses `go` to navigate to refresh repo folder, change background, and return the user home. Reloads the dock.
refresh() {
    # navigate to application directory
    go refresh
    cd wallpapers

    # refresh once
    cp "$(ls | sort --random-sort | head -n1)" ../wallpaper.jpg
    sqlite3 ~/Library/Application\ Support/Dock/desktoppicture.db "update data set value = '/Users/brycehawthorne/Documents/projects/refresh/wallpaper.jpg'";
    killall Dock

    # clean up terminal
    go home
    clear
}