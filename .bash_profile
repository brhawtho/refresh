alias goto=cd

# Find given directory and navigate to it
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

# Do background change from anywhere
refresh() {
    go refresh
    cd wallpapers
    cp "$(ls | sort --random-sort | head -n 1)" ../wallpaper.jpg
    cd ..
    osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Users/brycehawthorne/Documents/projects/refresh/loading.jpg"'
    sleep 1
    osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Users/brycehawthorne/Documents/projects/refresh/wallpaper.jpg"'
    go home
    clear
}