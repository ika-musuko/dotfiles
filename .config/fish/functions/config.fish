function config
	git --git-dir=$HOME/.cfg/ --work-tree=$HOME $argv[1..-1]
end
