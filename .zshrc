# +--------------+
# |  Setting up  |
# +--------------+


# Loading up z - https://github.com/rupa/z
. /usr/share/z/z.sh

# Paths:
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/home/xithrius/.local/bin:$PATH
export PIPENV_IGNORE_VIRTUALENVS=1
export ZSH="/home/xithrius/.oh-my-zsh"
export TERM=xterm-256color

autoload -U compinit && compinit

# Setting the theme:
ZSH_THEME="zeta"

plugins=(
	git
	git-extras
	gitfast
	history-substring-search
	colorize
	autopep8

	# https://github.com/zsh-users/zsh-syntax-highlighting
	zsh-syntax-highlighting

	# https://github.com/popstas/zsh-command-time
	command-time
)

source $ZSH/oh-my-zsh.sh


# +-----------+
# |  Aliases  |
# +-----------+


# Short and neat:
alias vim="nvim"
alias szsh="source ~/.zshrc"
alias py="python3"
alias gn="shutdown"

# git:
alias squash="git rebase -i origin/main"
alias switch_main="git branch -m master main && git fetch origin && git branch -u origin/main main && git restore ."

# Web requests:
alias rickroll="curl -L http://bit.ly/10hA8iC | bash"
alias weather="curl wttr.in"
alias moon="curl wttr.in/moon"
alias califire="curl -s http://iscaliforniaonfire.com/ | html2text - | tail -n4 | head -1 | cut -f2 -d' '"
alias ytdl="python -m youtube-dl -o '~/Music/%(title)s.mp3' -f 'bestaudio/best' --yes-playlist"
alias ytdl_vid="python -m youtube-dl -o '~/Videos/YouTube/%(title)s' --yes-playlist"

# Python inline scripts:
alias xkcd="python -c \"__import__('webbrowser').open('https://c.xkcd.com/random/comic')\""
alias lenof="python -c \"print(len(' '.join(__import__('sys').argv[1:])))\""

# Fun stuff:
alias fetch="neofetch | lolcat"

# Scripting:
alias total_commands="history | awk '{print $1}' | sort  | uniq --count | sort --numeric-sort --reverse | head -10" 


# +-------------+
# |  Functions  |
# +-------------+


# Customizing the zsh-command-time plugin:
zsh_command_time() {
    if [ -n "$ZSH_COMMAND_TIME" ]; then
        hours=$(($ZSH_COMMAND_TIME/3600))
        min=$(($ZSH_COMMAND_TIME/60))
        sec=$(($ZSH_COMMAND_TIME%60))
        if [ "$ZSH_COMMAND_TIME" -le 60 ]; then
            timer_show="$fg[green]$ZSH_COMMAND_TIME seconds"
        elif [ "$ZSH_COMMAND_TIME" -gt 60 ] && [ "$ZSH_COMMAND_TIME" -le 180 ]; then
            timer_show="$fg[yellow]$min minutes $sec seconds"
        else
            if [ "$hours" -gt 0 ]; then
                min=$(($min%60))
                timer_show="$fg[red]$hours hours $min minutes $sec seconds"
            else
                timer_show="$fg[red]$min minutes $sec seconds"
            fi
        fi
        printf "${ZSH_COMMAND_TIME_MSG}\n" "$timer_show"
    fi
}
