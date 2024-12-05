set -Ux ELECTRON_OZONE_PLATFORM_HINT wayland

if status is-interactive
    alias dotf "/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
    starship init fish | source
end
