local time='%{$fg[blue]%}%D{%H:%M}%{$reset_color%}'

local user='%{$fg[yellow]%}%n%{$reset_color%}'
local host='%{$fg[blue]%}%m%{$blue%}'

local at='%{$fg[green]%}@%{$reset_color%}'
local brl='%{$fg[red]%}[%{$reset_color%}'
local brr='%{$fg[red]%}]%{$reset_color%}'

local current_dir='%{$fg_bold[magenta]%}%2~%{$reset_color%}'

local return_code="%(?..%{$fg_bold[red]%}%?↵ %{$reset_color%})"
#local user_symbol='%(!.#.ﬦ) '
local user_symbol='%(!.#.») '

local git_branch='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

local venv_prompt='$(virtualenv_prompt_info)'
ZSH_THEME_VIRTUALENV_PREFIX="%{$fg[cyan]%}["
ZSH_THEME_VIRTUALENV_SUFFIX="]%{$reset_color%}"

#PROMPT="${time} ${brl}${user}${at}${host}: ${current_dir}${brr} ${user_symbol}"
PROMPT="${brl}${user}${at}${host}: ${current_dir}${brr} ${user_symbol}"
RPS1="${return_code}${git_branch}${venv_prompt}"
