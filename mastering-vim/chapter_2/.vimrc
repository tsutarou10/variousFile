syntax on                       " シンタックスハイライトを有効化
filetype plugin indent on       " ファイルタイプに基づいたインデントを有効化
set autoindent                  " 新しい行を始めるときに自動でインデント
set expandtab                   " タブをスペースに変換 (Pythonで必須)
set tabstop=4                   " タブをスペース4文字とカウント
set shiftwidth=4                " 自動インデントに使われるスペースの数
set backspace=2                 " 多くのターミナルでバックスペースの挙動を修正
colorscheme murphy              " カラースキームを変更
set directory=$HOME/.vim/swap// " swap fileの保存先を変更
set undofile                    " 永続undoが有効
if !isdirectory(expand("$HOME/.vim/undodir"))
    call mkdir(expand("$HOME/.vimr/undodir"), "p")
endif
set undodir=$HOMe/.vim/undodir

packloadall " すべてのプラグインをロードする
silent! helptags ALL " すべてのプラグインようにヘルプふぁいるをロードする






" =============== "
inoremap <silent> jj <ESC> " bind esc to jj
