# Disable printing of legal info.
alias gdb='gdb -q'

# Don't store duplicates in history.
export HISTCONTROL=ignoreboth:erasedups

# Use fd (https://github.com/sharkdp/fd) as the source for fzf.
export FZF_DEFAULT_COMMAND='fd --type f'
