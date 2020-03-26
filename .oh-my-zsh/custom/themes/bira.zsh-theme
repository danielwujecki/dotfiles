local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

if [[ $UID -eq 0 ]]; then
    local user_host='%{$terminfo[bold]$fg[red]%}%n@%m%{$reset_color%}'
    local user_symbol='#'
else
    local user_host='%{$terminfo[bold]$fg[yellow]%}%n%{$reset_color%}'
    local user_symbol='>'
fi

local git_branch='$(git_prompt_info)'
local vi_status='' # '$(vi_mode_prompt_info)'
local venv_prompt='$(virtualenv_prompt_info)'
local current_dir='%{$terminfo[bold]$fg[blue]%}%c%{$reset_color%}'
local time_count='%{$fg[blue]%}(%D{%H:%M} #$cmdcount)%{$reset_color%}'

PROMPT="╭─${venv_prompt} ${time_count} ${user_host} @ ${current_dir} ${git_branch} ${vi_status}
╰─%B${user_symbol}%b "
RPS1="%B${return_code}%b"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
ZSH_THEME_VIRTUALENV_PREFIX="%{$fg[cyan]%}["
ZSH_THEME_VIRTUALENV_SUFFIX="]%{$reset_color%}"
