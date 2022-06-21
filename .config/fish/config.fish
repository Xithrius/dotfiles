if status is-interactive && not set -q TMUX
    exec tmux
end

set -gx PATH $HOME/.cargo/bin $HOME/.donet/tools $PATH
setenv SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket
setenv GPG_TTY (tty)
setenv SSH_ASKPASS ssh-askpass
setenv TERM xterm-256color

alias l="ls -al"
alias gst="git status"
alias chmox="chmod +x"
alias vim="nvim"
alias hibernate="sudo systemctl hibernate"
alias gn="shutdown"
alias btop="bashtop"
alias m="micro"
alias orphans="pacman -Qtdq"
alias killorphans="sudo pacman -Rnu (pacman -Qtdq)"

starship init fish | source
