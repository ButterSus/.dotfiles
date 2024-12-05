set -x WAYLAND_DISPLAY "wayland-0"

if status is-interactive
    alias dotf "/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
end
