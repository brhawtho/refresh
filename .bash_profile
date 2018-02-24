# define global aliases used elsewhere
alias goto=cd

# go dir
# dir - directory to find and navigate to
# function will change directory to the shortest path to the named directory, printing the full path when found
go() {
    if [[ $# -eq 0 || "$1" == "--help" ]]; then
        # display usage if no parameters given
        echo "usage: go [--help] [dir]"
        return
    else
        echo -e "$(tput setaf 1)leaving  $(tput sgr0)\c" && pwd
        if [[ "$1" == "home" ]]; then
            # navigate to user's home
            goto ~
        else
            # find shortest path to directory, go to it
            dir="$(find ~ -iname $1 -print | sort -V | head -n 1)"
            if [[ $dir ]]; then
                goto $dir
            else
                echo "-bash: go: $1: No such file or directory"
                return
            fi
        fi
        echo -e "$(tput setaf 2)entering $(tput sgr0)\c" && pwd
    fi
}

# refresh
# function uses `go` to navigate to refresh repo folder, change background, and return the user home. Reloads the dock.
refresh() {
    go refresh
    cd wallpapers
    cp "$(ls | sort --random-sort | head -n 1)" ../wallpaper.jpg
    go home
    sqlite3 ~/Library/Application\ Support/Dock/desktoppicture.db "update data set value = '/Users/brycehawthorne/Documents/projects/refresh/wallpaper.jpg'";
    killall Dock
    clear
}