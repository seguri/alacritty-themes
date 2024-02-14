#!/opt/homebrew/bin/bash

set -euo pipefail

LIGHT_THEME=CHANGEME
DARK_THEME=CHANGEME
FOOTER=CHANGEME

errcho () {
    echo >&2 "$@"
    exit 1
}

[[ -f $LIGHT_THEME ]] || errcho "$LIGHT_THEME: no such file"
[[ -f $DARK_THEME ]] || errcho "$DARK_THEME: no such file"
[[ -f $FOOTER ]] || errcho "$FOOTER: no such file"


if [[ ${1:-off} == on ]]; then
    /bin/cat $DARK_THEME $FOOTER
else
    /bin/cat $LIGHT_THEME $FOOTER
fi

