# Runs on log-in
export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/vim
export TERMINAL="st"
export BROWSER="firefox"
#Adds ~/bin and all subdirectories to the PATH
export PATH="$PATH:$(du "$HOME/bin/" | cut -f2 | tr '\n' ':')"