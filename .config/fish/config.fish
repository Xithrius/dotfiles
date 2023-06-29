if status is-interactive && not set -q TMUX
    exec tmux
end

setenv SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket
setenv GPG_TTY (tty)
setenv SSH_ASKPASS ssh-askpass
setenv EDITOR nvim 
setenv DEBUGINFOD_URLS "https://debuginfod.archlinux.org"
setenv QT_QPA_PLATFORMTHEME qt5ct
setenv TERM xterm-256color
set -gx PATH $HOME/.local/bin $HOME/.cargo/bin /usr/lib/ssh $HOME/.yarn/bin $PATH


# +---------+
# |  Short  |
# +---------+

alias chmox="chmod +x"
alias gn="shutdown"
alias rm="rm -i"
alias py="python3"
alias v="nvim"
alias b="btop"


# +-------------+
# |  Not short  |
# +-------------+

alias weather="curl wttr.in"
alias moon="curl wttr.in/moon"
alias xkcd="xdg-open 'https://xkcd.com/'"
alias timedatectl="sudo timedatectl set-ntp true"
alias ytdl="yt-dlp -o '%(title)s.%(ext)s' --yes-playlist"
alias mp3="yt-dlp -o '%(title)s.mp3' -x --yes-playlist --audio-format mp3"
alias aur="pacman -Qm"


# +-------+
# |  Git  |
# +-------+

abbr -ag g git
alias gst="git status"
alias squash="git rebase -i"


# +----------+
# |  System  |
# +----------+

alias orphans="pacman -Qtdq"
alias killorphans="sudo pacman -Rnu (pacman -Qtdq)"
alias hibernate="systemctl hibernate"
alias zzz="systemctl suspend"
alias windows="systemctl reboot --boot-loader-entry=auto-windows"
alias bios="systemctl reboot --firmware-setup"
alias howold="echo Install started on (head -1 /var/log/pacman.log | cut -d ' ' -f 1)"
alias netscan='nmap -sn 192.168.1.0/24'
alias mirrorlist='sudo reflector --latest 25 --country US --protocol https --sort rate --save /etc/pacman.d/mirrorlist'
alias trash="cd ~/.local/share/Trash/files/"
alias hdd="cd /mnt/hdd1/"
alias upgraded="grep -i upgraded /var/log/pacman.log"


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

