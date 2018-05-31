# define global aliases for functions
alias gcd=cd

# go [-h | --help] [-l | --list] [dir]
function go() {
    # unset flags
    unset HELP LIST DIR

    # parse args
    while [[ $# -gt 0 ]]; do
        key="$1"
        case $key in
            -h|--help)  # print usage
                HELP=true
                shift
                ;;
            -l|--list)  # list dir contents
                LIST=true
                shift
                ;;
            -?|--*) # unknown option
                echo "go: $1: invalid option"
                HELP=true
                break
                ;;
            *)  # directory
                DIR="$1"
                shift
                ;;
        esac
    done

    if [[ $HELP == true ]]; then # display usage
        echo "usage: go [-h | --help] [-l | --list] [dir]"
        return
    fi

    # else find shortest path to directory
    if [[ -z $DIR ]]; then
        dir="${HOME}"
    else
        dir="$(find ~ -iname $DIR | sort -n | head -n1)"
    fi

    curr="$(pwd)"
    if [[ "$dir" == "" ]]; then # couldn't find dir
        echo "go: $DIR: No such file or directory"
        return
    elif [[ "$dir" == "$curr" ]]; then # already in dir
        echo "go: Already in $dir"
    else # navigate to dir
        echo -e "$(tput setaf 1)leaving  $(tput sgr0)\c" && pwd
        gcd $dir
        echo -e "$(tput setaf 2)entering $(tput sgr0)\c" && pwd
    fi

    if [[ $LIST == true ]]; then # list contents
        ls
    fi
}

# refresh
function refresh() {
    # navigate to application directory
    go refresh
    cd wallpapers

    # change wallpaper randomly
    cp "$(ls | sort --random-sort | head -n1)" ../wallpaper.jpg
    sqlite3 ~/Library/Application\ Support/Dock/desktoppicture.db "update data set value = '/Users/brycehawthorne/Documents/projects/refresh/wallpaper.jpg'"
    killall Dock

    # clean up terminal
    go
    clear
}