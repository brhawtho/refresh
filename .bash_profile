#   Update all Wallpapers
function wallpaper() {
    osascript -e 'tell application "Finder" to set desktop picture to POSIX file "~/Documents/projects/refresh/wallpapers/test.jpg"'
}