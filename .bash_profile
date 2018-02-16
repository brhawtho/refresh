# Move new image, set background
function refresh() {
    go wallpapers
    cp "$(ls | sort -R | head -n 1)" ../wallpaper.jpg
    cd ..
    osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Users/brycehawthorne/Documents/projects/refresh/reset.jpg"'
    osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Users/brycehawthorne/Documents/projects/refresh/wallpaper.jpg"'
    go home
}