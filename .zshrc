autoload colors
colors

# zplug
source ~/.zplug/init.zsh
# vcs_infoロード
autoload -Uz vcs_info
# PROMPT変数内で変数参照する
setopt prompt_subst

# vcsの表示
zstyle ':vcs_info:*' formats '%s][* %F{green}%b%f'
zstyle ':vcs_info:*' actionformats '%s][* %F{green}%b%f(%F{red}%a%f)'

# プロンプト表示直前にvcs_info呼び出し
function precmd() {
    vcs_info
}

# vcs_info_msg_0_の書式設定
# zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' check-for-changes false
zstyle ':vcs_info:git:*' stagedstr         "%F{yellow}!%f"
zstyle ':vcs_info:git:*' unstagedstr       "%F{red}+%f"
zstyle ':vcs_info:*'     formats           " (%F{green}%b%f%c%u)"
zstyle ':vcs_info:*'     actionformats     ' (%b|%a)'

zplug "zsh-users/zsh-syntax-highlighting"

# history関係
zplug "zsh-users/zsh-history-substring-search"
# タイプ補完
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi
# Then, source plugins and add commands to $PATH
zplug load

# 補完後、メニュー選択モードになり左右キーで移動が出来る
zstyle ':completion:*:default' menu select=2

# プロンプト
OK="^_^ "
NG="X_X "

local prompt_location="%F{cyan}%B%~%b%f"
local promot_mark="%B%(?,%F{magenta},%F{red})%(!,#,❯)%b"

export PATH="$PATH:/Users/tatsuro/flutter/bin"

#pecoでhistory検索
function peco-select-history() {
  BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

function ghq-list() {
  find $(ghq root) -d 1 -maxdepth 1 | grep -v DS_Store | sed -e "s#$(ghq root)/##g"
}

function peco-src() {
  local root_github="/Users/tatsuro/Desktop/github"
  local selected_dir=$(ghq-list | peco --query "$LBUFFER")
  selected_dir=${root_github}"/"${selected_dir}
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

alias ctags="/usr/local/Cellar/ctags/5.8_1/bin/ctags"
# プロンプト
OK="^_^ "
NG="X_X "
PROMPT="
${prompt_location}"'$vcs_info_msg_0_'" %(?.%F{green}$OK%f.%F{red}$NG%f)
${promot_mark} "
RPROMPT="%F{red}  %D{%H:%M:%S} %f"

export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export GOENV_ROOT=$HOME/.goenv
export PATH=$GOENV_ROOT/bin:$PATH
export PATH=$HOME/.goenv/bin:$PATH
export GO111MODULE=auto
eval "$(goenv init -)"

export PATH=$PATH:/usr/bin/openssl
alias brew='PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin brew'
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH=$PATH:"/opt/local/bin:/opt/local/sbin"
export PATH=$PATH:/Users/tatsuro/Library/Android/sdk/platform-tools

alias cp-temp='cp /Users/tatsuro/Desktop/github/competitive-programming/template.cpp $1'
