#!/bin/bash

# check for env variables
if [ -z ${JD_CONFIG+x} ]; then
    echo "Error: missing environment variable: JD_CONFIG (path to jd-config directory)"
    ENV_ERROR=true
elif [ ! -d ${JD_CONFIG} ]; then
    echo "Error: path to JD_CONFIG (${JD_CONFIG}) does not exist..."
    ENV_ERROR=true
fi

if [ -z ${JD_WORKSPACE+x} ]; then
    echo "Error: missing environment variable: JD_WORKSPACE (path to projects directory)"
    ENV_ERROR=true
elif [ ! -d ${JD_WORKSPACE} ]; then
    echo "Error: path to JD_WORKSPACE (${JD_WORKSPACE}) does not exist..."
    ENV_ERROR=true
fi

if [ "${ENV_ERROR}" == true ]; then
    exit 1
fi

SETUP_ROOT=$(pwd)

# dotfiles which should be replaced with symlinks
dotfiles_symlink=(
    .gitconfig
    .bash_profile
    .vimrc
    .vim
)

NOW=$(date +"%F--%H-%M-%S")

# replace dotfiles in home directory with symlinks to custom dotfiles
for f in "${dotfiles_symlink[@]}"; do
    if [ -f ${HOME}/${f} ] || [ -d ${HOME}/${f} ]; then
        echo "> ${HOME}/${f} exists"
        echo "> making backup at ${HOME}/${f}-${NOW}.bak"
        mv ${HOME}/${f} ${HOME}/${f}-${NOW}.bak
    else
        echo "> ${HOME}/${f} does not exist"
    fi

    echo ">> creating symlink from ${HOME}/${f} to ${SETUP_ROOT}/jd-config/${f}"
    ln -s ${SETUP_ROOT}/jd-config/${f} ${HOME}/${f}
done

# source custom .bashrc from existing .bashrc
if [ -f ${HOME}/.bashrc ]; then
        echo "> ${HOME}/.bashrc exists"
        echo "> making backup at ${HOME}/.bashrc-${NOW}.bak"
        cp ${HOME}/.bashrc ${HOME}/.bashrc-${NOW}.bak

        echo -e "\n\n################################" >> ${HOME}/.bashrc
        echo "# appended using setup-dotfiles.sh - ${NOW}" >> ${HOME}/.bashrc
        echo -e "################################\n" >> ${HOME}/.bashrc
        echo "export JD_CONFIG=\"${JD_CONFIG}\"" >> ${HOME}/.bashrc
        echo "export JD_WORKSPACE=\"${JD_WORKSPACE}\"" >> ${HOME}/.bashrc
        echo "source ${SETUP_ROOT}/jd-config/.bashrc" >> ${HOME}/.bashrc
else
        echo "> ${HOME}/.bashrc does not exist"
fi

source ${HOME}/.bashrc
