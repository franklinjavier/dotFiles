#!/bin/bash
echo "vim-scp FTW"
if [ $# -ne 2 ]; then
    echo "usage : `basename $0` user@host /path"
    exit 1
fi
COMMAND="ssh $1 -f -N -o ControlMaster=auto -o ControlPath=/tmp/%r@%h:%p"
echo "opening ssh tunnel.."
$COMMAND || exit $?
echo "ssh tunnel active, opening vim.."
vim scp://$1$2
echo "closing ssh tunnel.."
ps -ef | grep "$COMMAND" | grep -v grep | awk '{print $2}' | xargs kill -9
echo "Great Success!"
