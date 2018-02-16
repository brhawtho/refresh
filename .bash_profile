# Update all Wallpapers
function wallpaper() {
    osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Users/brycehawthorne/Documents/projects/refresh/wallpaper2.jpg"'
}

alias change=wallpaper

# Move new image, set background
function refresh() {
    cd wallpapers
    cp "$(ls | sort -R | head -n 1)" ../wallpaper.jpg
    cd ..
    osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Users/brycehawthorne/Documents/projects/refresh/wallpaper.jpg"'
}