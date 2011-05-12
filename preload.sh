# Create a preload.el emacs script based on a list of files, ignoring lines
# starting with #
awk '! /^#/ { print "(find-file \""$1"\")" }' ~/.xemacs/preload > ~/.xemacs/preload.el
