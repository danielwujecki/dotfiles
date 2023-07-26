if [[ $UID -eq 0 ]]; then
    local user_host='%{$terminfo[bold]$fg[red]%}%n@%m%{$reset_color%}'
    local user_symbol='#'
else
    local user_host='%{$terminfo[bold]$fg[green]%}%n%{$reset_color%}'
    local user_symbol="%(?..%{$fg[red]%}%? %{$reset_color%})-> "
fi

if [[ -n $SSH_CONNECTION ]] ; then
    local ssh_prefix='(%m) '
else
    local ssh_prefix=''
fi

local time_count='%{$fg[blue]%}#$cmdcount %D{%H:%M}%{$reset_color%}'
local current_dir='%{$terminfo[bold]$fg[blue]%}%c%{$reset_color%}'

local git_branch='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

local venv_prompt='$(virtualenv_prompt_info)'
ZSH_THEME_VIRTUALENV_PREFIX="%{$fg[cyan]%}["
ZSH_THEME_VIRTUALENV_SUFFIX="]%{$reset_color%}"

PROMPT="${ssh_prefix}${time_count} [${user_host}@${current_dir}] %B${user_symbol}%b"
RPS1="${git_branch}${venv_prompt}"
