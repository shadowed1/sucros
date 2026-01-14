#!/bin/bash
# ChromeOS Elevated Shell
# shadowed1

if [[ -f /tmp/machine-info ]]; then
    DEVICE_NAME=$(grep '^customization_id=' /tmp/machine-info 2>/dev/null | cut -d= -f2 | tr -d '"')
else
    DEVICE_NAME="chromeos"
fi

if [[ -f /sys/class/chromeos/cros_ec/version ]]; then
    BOARD_REV=$(grep '^Board version:' /sys/class/chromeos/cros_ec/version 2>/dev/null | awk '{print $3}')
    BOARD_REV="rev$BOARD_REV"
else
    BOARD_REV="rev?"
fi

USER_NAME=${USER:-$(whoami)}

BLUE=$(tput setaf 4)
BOLD_BLUE=$(tput bold; tput setaf 4)
BOLD_GREEN=$(tput bold; tput setaf 2)
RESET=$(tput sgr0)

ORIGINAL_PS1="${BOLD_GREEN}$USER_NAME@$DEVICE_NAME-$BOARD_REV${RESET}${BOLD_BLUE} \w $ ${RESET}"
ELEVATED_PS1="${BLUE}[sudo enabled]${RESET} ${BOLD_GREEN}$USER_NAME@$DEVICE_NAME-$BOARD_REV${RESET}${BOLD_BLUE} \w $ ${RESET}"

export PS1="$ELEVATED_PS1"
exec bash --norc -i
