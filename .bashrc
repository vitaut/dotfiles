# Disable printing of legal info.
alias gdb='gdb -q'

# Don't store duplicates in history.
export HISTCONTROL=ignoreboth:erasedups

# Use fd (https://github.com/sharkdp/fd) as the source for fzf.
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Kill old mosh session.
mosh_pid=`ps -C mosh-server kstart_time opid= | head -n -1`
if [[ ! -z "$mosh_pid" ]]; then kill "$mosh_pid"; fi
