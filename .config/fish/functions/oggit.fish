function oggit
	youtube-dl -i $argv[1] -x --audio-format vorbis
end
