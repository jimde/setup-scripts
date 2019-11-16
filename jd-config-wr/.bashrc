# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Set system-specific workspace paths

case ${HOSTNAME} in
    (yow-ssp5-lx)
        export JD_WORKSPACE="/buildarea4/jdeng1/" ;;
    (yow-ssp6-lx)
        export JD_WORKSPACE="/buildarea10/jdeng1/" ;;
    (yow-jdeng1-lx1)
        export JD_WORKSPACE="/home/jdeng1/workspace/" ;;
    (*) ;;
esac

# Common stuff

export PATH="$PATH:$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/opt/sfw/bin:/opt/sfw/sbin:/usr/sfw/bin:/usr/fw/sbin"
export JD_CONFIG="/folk/jdeng1/jd-config/"
color_prompt=yes
force_color_prompt=yes

source ${JD_CONFIG}/common-env-variables

# Set Helix development paths, eg. WASSP

source ${JD_CONFIG}/vx-env-setup

# Source system-specific configs

source ${JD_CONFIG}/${HOSTNAME}-env-setup

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

