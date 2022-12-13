#!/bin/sh
set -e

echo "Activating feature 'nf-test'"

su ${_REMOTE_USER} -c "mkdir -p ~/.local/bin && cd ~/.local/bin && curl -fsSL https://code.askimed.com/install/nf-test | bash"



