local time='%{$fg[blue]%}%D{%H:%M}%{$reset_color%}'

local user='%{$fg[yellow]%}%n%{$reset_color%}'
local host='%{$fg[blue]%}%m%{$blue%}'

local at='%{$fg[green]%}@%{$reset_color%}'
local brl='%{$fg[red]%}[%{$reset_color%}'
local brr='%{$fg[red]%}]%{$reset_color%}'

local current_dir='%B%{$fg[magenta]%}%c%{$reset_color%}%b'

local return_code="%B%(?..%{$fg[red]%}%? %{$reset_color%})%b"
local user_symbol='%(!.#.$) '

PROMPT="${time} ${brl}${user}${at}${host}: ${current_dir}${brr} ${return_code}${user_symbol}"

local git_branch='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

local venv_prompt='$(virtualenv_prompt_info)'
ZSH_THEME_VIRTUALENV_PREFIX="%{$fg[cyan]%}["
ZSH_THEME_VIRTUALENV_SUFFIX="]%{$reset_color%}"

RPS1="${git_branch}${venv_prompt}"
