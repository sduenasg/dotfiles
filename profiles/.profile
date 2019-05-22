# Runs on log-in
export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nvim
export TERMINAL="st"
export BROWSER="firefox"

#Adds ~/bin and all subdirectories to the PATH
export PATH="$PATH:$(du "$HOME/bin/" | cut -f2 | tr '\n' ':')"
export PATH=$PATH:/usr/local/games

# .NET core
export PATH=$PATH:/home/sara/.dotnet/tools
export ASPNETCORE_Environment=Development

# Android studio fix on dwm
export _JAVA_AWT_WM_NONREPARENTING=1
