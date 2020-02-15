#!/bin/bash

SETUP_ROOT=$(pwd)

NOW=$(date +"%F--%H-%M-%S")

VSCODE_SETTINGS_DIR="${HOME}/.config/Code/User"
VSCODE_SETTINGS_FILE="settings.json"

if [ -f "${VSCODE_SETTINGS_DIR}/${VSCODE_SETTINGS_FILE}" ]; then
        echo "> ${VSCODE_SETTINGS_DIR}/${VSCODE_SETTINGS_FILE} exists"
        echo "> making backup at ${VSCODE_SETTINGS_DIR}/${VSCODE_SETTINGS_FILE}-${NOW}.bak"
        mv ${VSCODE_SETTINGS_DIR}/${VSCODE_SETTINGS_FILE} ${VSCODE_SETTINGS_DIR}/${VSCODE_SETTINGS_FILE}-${NOW}.bak
else
        echo "> ${VSCODE_SETTINGS_DIR}/${VSCODE_SETTINGS_FILE} does not exist"
fi

echo ">> creating symlink from ${VSCODE_SETTINGS_DIR}/${VSCODE_SETTINGS_FILE} to ${SETUP_ROOT}/jd-config/vscode/${VSCODE_SETTINGS_FILE}"
    ln -s ${SETUP_ROOT}/jd-config/vscode/${VSCODE_SETTINGS_FILE} ${VSCODE_SETTINGS_DIR}/${VSCODE_SETTINGS_FILE}

./vscode-setup/install-common-extensions.sh