# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export JD_WORKSPACE="~/Documents/"

# Common stuff

export PATH="$PATH:$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/opt/sfw/bin:/opt/sfw/sbin:/usr/sfw/bin:/usr/fw/sbin"
export JD_CONFIG="~/Documents/setup-scripts/jd-config/"
color_prompt=yes
force_color_prompt=yes

source ${JD_CONFIG}/common-env-variables

# Set common aliases

source ${JD_CONFIG}/common-alias

# User specific aliases and functions

# old prompt
# export PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$'

# new prompt with colours

# case $HOSTNAME in
#     (yow-ssp5-lx) source ~/ssp5setup.sh ;;
#     (yow-ssp6-lx) source ~/ssp6setup.sh ;;
#     (yow-jdeng1-lx1) source ~/jdeng1setup.sh ;;
#     (*) ;;
# esac

# Set prompt colours

source ${JD_CONFIG}/prompt-colours
