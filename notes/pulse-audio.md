## pavucontrol

- install `pavucontrol`


## set up virtual sink

- https://endless.ersoft.org/pulseaudio-loopback/
- `pactl list modules`
- `pactl load-module module-null-sink sink_name=Virtual1`
- `pactl load-module module-loopback sink=Virtual1`
