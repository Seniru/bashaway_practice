#! /bin/bash

i=0
while [[ true ]]; do
    echo $i
    sleep 1
    (( i+=1 ))
done

# https://superuser.com/questions/262942/whats-different-between-ctrlz-and-ctrlc-in-unix-command-line
# Ctrl - C will kill (SIGINT)
# Ctrl - Z will suspend (SIGTSTP)

# we can resume the process back in foreground (fg) and background (bg)
