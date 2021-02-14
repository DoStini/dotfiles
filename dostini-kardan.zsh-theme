# Simple theme based on my old zsh settings.

function get_host {
	echo '@'$HOST
}

function get_user {
	echo $USER
}

PROMPT='%{$fg_bold[red]%}$(get_user)$(get_host) %{$fg_bold[white]%}> '
RPROMPT='%{$fg[yellow]%}%~$(git_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
