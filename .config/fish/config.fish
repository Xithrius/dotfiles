if status is-interactive && not set -q TMUX
    exec tmux
end

set -gx PATH $HOME/.cargo/bin $HOME/.donet/tools $PATH
setenv SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket
setenv GPG_TTY (tty)
setenv SSH_ASKPASS ssh-askpass
setenv TERM xterm-256color


# +---------+
# |  Short  |
# +---------+

alias chmox="chmod +x"
alias vim="nvim"
alias gn="shutdown"
alias btop="bashtop"
alias m="micro"
alias rm="rm -i"
alias pls="sudo"
alias py="python3"
alias lg="lazygit"
alias ld="lazydocker"
alias h="history | wc -l"


# +-------+
# |  Git  |
# +-------+

abbr -ag g git
alias gst='git status'
alias gl='git log --color --graph --pretty=format:'\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --abbrev-commit'
alias ga='git add'
alias gc='git commit -v'
alias gd='git diff'
alias gp='git push'
alias gu='git pull'


# +----------+
# |  System  |
# +----------+

alias orphans="pacman -Qtdq"
alias killorphans="sudo pacman -Rnu (pacman -Qtdq)"
alias hibernate="systemctl hibernate"
alias zzz="systemctl suspend"
alias howold="echo Install started on (head -1 /var/log/pacman.log | cut -d ' ' -f 1)"


# +-------------+
# |  Functions  |
# +-------------+

function l -d "alias l=exa -aF --group-directories-first"
    exa -aF --group-directories-first $argv
end

function ll --description "alias ll=l -lh --time-style long-iso"
    l -lh --git --time-style long-iso $argv
end

starship init fish | source
