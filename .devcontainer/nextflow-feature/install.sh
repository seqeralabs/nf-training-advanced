#!/bin/sh
set -e

echo "Activating feature 'nextflow'"

su ${_REMOTE_USER} -c "mkdir -p ~/.local/bin && cd ~/.local/bin && curl -s https://get.nextflow.io | bash"



