autoload colors
colors

OK="^_^ "
NG="X_X "
PROMPT="%(?.%F{green}$OK%f.%F{red}$NG%f)
 "
PROMPT+="%{${fg[blue]}%}(%~) %{${reset_color}%}
$ "
#RPROMT="%F{white} %D{%Y-%m-%d %H:%M:%S} %f"
#PROMPT="%{$fg[blue]%}%m%(!.#.$) %{$reset_color%}"
#PROMPT="%{${fg[red]%}%}%{${reset_color%}%} %~ %# "
#[hostname]%                                          19:32:23
#RPROMT=19:32:23
RPROMPT="%F{red}  %D{%H:%M:%S} %f"
export PATH=$PATH:/usr/sbin/

# 補完
autoload -Uz compinit
compinit 
ZSH_THEME="wedisagree"
alias ls='ls -G'
export LSCOLORS=bxfxcxdxcxegefabagacad
export PATH=$HOME/.nodebrew/current/bin:$PATH


