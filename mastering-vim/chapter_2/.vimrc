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

noremap <c-h> <c-w><c-h> " window移動のマッピング
noremap <c-j> <c-w><c-j> " window移動のマッピング
noremap <c-k> <c-w><c-k> " window移動のマッピング
noremap <c-l> <c-w><c-l> " window移動のマッピング

set foldmethod=indent
set wildmenu " Tabによる自動保管を有効にする
set wildmode=list:longest,full " 最長マッチまで補完してから自動補完メニューを開く


" ======= NeoBundle setting ========"
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
set nocompatible " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

if has('vim_starting')
    " 初回起動時のみruntimepathにNeoBundleのパスを指定する
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    "
    " NeoBundleが未インストールであればgit cloneする・・・・・・①
    if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
        echo "install NeoBundle..."
        :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
    endif
endif
call neobundle#begin(expand('~/.vim/bundle/'))
"インストールするVimプラグインを以下に記述
" NeoBundle自身を管理
NeoBundleFetch 'Shougo/neobundle.vim'
" =============== NeoBundle start ====================="
    NeoBundle 'scrooloose/nerdtree'
    NeoBundle 'tpope/vim-unimpaired'

call neobundle#end()
" =============== NeoBundle end ======================="

let NERTTreeShowBokmarks=1 " 起動時にブックマークを表示
autocmd VimEnter * NERDTree " Vim起動時にNERTreeを開く
" NERDTreeのウィンドウしか開かれていないときは自動的に閉じる
autocmd bufenter * if(winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
