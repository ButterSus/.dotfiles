if status is-interactive
    function dotf
	/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv
    end
end
