function restartpulseaudio
	killall pulseaudio
sleep 2
pulseaudio &
end
