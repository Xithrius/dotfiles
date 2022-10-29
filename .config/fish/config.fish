if status is-interactive && not set -q TMUX
    exec tmux
end

set -gx PATH $HOME/.local/bin $HOME/.cargo/bin $HOME/.donet/tools /usr/lib/ssh $HOME/.yarn/bin $PATH
setenv SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket
setenv GPG_TTY (tty)
setenv SSH_ASKPASS ssh-askpass
setenv TERM xterm-256color
setenv EDITOR code


# +---------+
# |  Short  |
# +---------+

alias chmox="chmod +x"
alias gn="shutdown"
alias rm="rm -i"
alias py="python3"
alias vim="nvim"


# +-------------+
# |  Not short  |
# +-------------+

alias weather="curl wttr.in"
alias moon="curl wttr.in/moon"
alias h="history | wc -l"
alias xkcd="xdg-open 'https://xkcd.com/'"
alias settime="timedatectl set-ntp true"
alias zip="7z a -tzip"
alias flac="yt-dlp -o '%(title)s.flac' -x --audio-format flac"
alias ytdl="yt-dlp -o '%(title)s.%(ext)s' --yes-playlist"
alias ytdl="yt-dlp -o '%(title)s.%(ext)s' --yes-playlist"

# +-------+
# |  Git  |
# +-------+

abbr -ag g git
alias gst="git status"
alias gs="git stash"
alias ga="git add"
alias gc="git commit -m"
alias gd="git diff"
alias gds="git diff --stat"
alias gp="git push"
alias gu="git pull"
alias gl="git log"
alias squash="git rebase -i"
alias tomain="git branch -m master main && git fetch origin && git branch -u origin/main main && git remote set-head origin -a"


# +----------+
# |  System  |
# +----------+

alias orphans="pacman -Qtdq"
alias killorphans="sudo pacman -Rnu (pacman -Qtdq)"
alias hibernate="systemctl hibernate"
alias windows="systemctl reboot --boot-loader-entry=auto-windows"
alias zzz="systemctl suspend"
alias howold="echo Install started on (head -1 /var/log/pacman.log | cut -d ' ' -f 1)"
alias netscan='nmap -sn 192.168.1.0/24'


# +-------------+
# |  Functions  |
# +-------------+

function l -d "alias l=exa -aF --group-directories-first"
    exa -aF --group-directories-first $argv
end

function ll --description "alias ll=l -lh --time-style long-iso"
    l -lh --git --time-style long-iso $argv
end

function search -d "Search the given query on duckduckgo"
  xdg-open "https://duckduckgo.com/?q="(string join '%20' $argv)
end

function stream -d "Stream a link with streamlink and mpv"
  streamlink --player=mpv $argv best
end

starship init fish | source

