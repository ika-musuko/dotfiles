function symlink
	sudo ln -s $argv[1] /usr/bin/(basename $argv[1])
end
