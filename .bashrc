# Attach to a tmux session.
if [[ $HOSTNAME == *"facebook.com" ]]; then
  [[ $TERM != "screen" ]] && exec tmux attach
fi

