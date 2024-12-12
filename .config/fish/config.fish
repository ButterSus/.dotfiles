set -Ux ELECTRON_OZONE_PLATFORM_HINT wayland
set -Ux QT_QPA_PLATFORMTHEME qt6ct
set -Ux SUDO_EDITOR /usr/bin/nvim

if status is-interactive
  alias dotf "/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
  alias gitui "gitui -t catppuccin-mocha.ron"
  alias vps "ssh hochesh_vps"

  starship init fish | source
end
