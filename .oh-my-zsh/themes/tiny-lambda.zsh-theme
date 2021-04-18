local starter='λ'

function get_pwd() {
    git_root=$PWD
    while [[ $git_root != / && ! -e $git_root/.git ]]; do
        git_root=$git_root:h
    done
    if [[ $git_root = / ]]; then
        unset git_root
        prompt_short_dir=%~
    else
        parent=${git_root%\/*}
        prompt_short_dir=${PWD#$parent/}
    fi
    echo $prompt_short_dir
}

# Git info.
ZSH_THEME_GIT_PROMPT_PREFIX="%{$blue_bold%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$green_bold%} ✔"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$red_bold%} ✘" 

ret_status="%(?:%{$fg_bold[green]%}$starter :%{$fg_bold[red]%}$starter %s)"    
PROMPT='$ret_status %{$fg[white]%}$(get_pwd) $(git_prompt_info)%{$reset_color%}%{$reset_color%} '

