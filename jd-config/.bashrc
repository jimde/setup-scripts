# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export JD_WORKSPACE="~/Documents/"

# Common stuff

if [ -z ${JD_CONFIG+x} ]; then
	export JD_CONFIG="~/Documents/setup-scripts/jd-config/"
fi

export PATH="$PATH:$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/opt/sfw/bin:/opt/sfw/sbin:/usr/sfw/bin:/usr/fw/sbin"
color_prompt=yes
force_color_prompt=yes

source ${JD_CONFIG}/common-env-variables

# Set common aliases

source ${JD_CONFIG}/common-alias

# Set prompt colours

source ${JD_CONFIG}/prompt-colours
