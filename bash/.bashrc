# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)';
PS1='\[\e[38;5;32m\]┌─\[\e[38;5;184;1m\]\u@\h\[\e[0m\] \w \[\e[38;5;81;3m\]${PS1_CMD1}\n\[\e[0;38;5;32m\]└─\[\e[0;1m\]\A\[\e[0m\] \$ '

eval "$(starship init bash)"
