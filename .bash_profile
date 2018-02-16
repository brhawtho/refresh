alias copy=cp

# Update all Wallpapers
function wallpaper() {
    osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Users/brycehawthorne/Documents/projects/refresh/wallpaper.jpg"'
}

alias change=wallpaper

# Move new image, set background
function refresh() {
    cd wallpapers
    copy "$(ls | sort -R | head -n 1)" "../wallpaper.jpg"
    cd ..
    change
}