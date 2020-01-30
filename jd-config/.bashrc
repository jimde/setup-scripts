# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Common stuff

# check for env variables
if [ -z ${JD_CONFIG+x} ]; then
    echo "Error: missing environment variable: JD_CONFIG (path to jd-config directory)"
fi

if [ -z ${JD_WORKSPACE+x} ]; then
    echo "Error: missing environment variable: JD_WORKSPACE (path to projects directory)"
fi

export PATH="$PATH:$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/opt/sfw/bin:/opt/sfw/sbin:/usr/sfw/bin:/usr/fw/sbin:/opt/gcc-arm-none-eabi/bin"
color_prompt=yes
force_color_prompt=yes

source ${JD_CONFIG}/common-env-variables

# Set common aliases

source ${JD_CONFIG}/common-alias

# Set prompt colours

source ${JD_CONFIG}/prompt-colours
