syntax on
set cursorline
autocmd ColorScheme * highlight LineNr ctermfg=239
set number
set tabstop=4
set autoindent
set shiftwidth=4
set hlsearch
set foldlevel=100
" 0が前置されていても10進数で認識
set nrformats=
" 1文字入力ごとに検索
set incsearch
" 検索パターンに大文字小文字を区別しない
set ignorecase
" 検索パターンに大文字を含んでいたら大文字小文字を区別
set smartcase
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
" カーソルの左右移動で行末から次の行頭への移動が可能
set whichwrap=b,s,h,l,<,>,[,],~
" 行が折り返し表示されていた場合、行単位ではなく表示単位でカーソルを移動
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
    
" バックスペースキーの有効化
" set backspace=indent,eol,start
" コマンドモードの補完
set wildmenu
set history=5000
" マウスの有効化
"if has('mouse')
"	set mouse=a
"	if has('mouse_sgr')
"		set ttymouse=sgr
"	elseif v:version > 703 || v:version is 703 && has('patch632')
"		set ttymouse=sgr
"	else
"		set ttymouse=xterm2
"	endif
"endif
" クリップボードからペーストするときにインデントでズレていかない
if &term =~ "xterm"
	let &t_SI .= "\e[?2004h"
	let &t_EI .= "\e[?2004l"
	let &pastetoggle = "\e[201~"

	function XTermPasteBegin(ret)
		set paste
		return a:ret
	endfunction

	inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif
     
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
	set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'fenetikm/falcon'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
au BufRead,BufNewFile *.md set filetype=markdown

" htmlタグの補完
augroup MyXML
	autocmd!
	autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
	autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END
set nobackup
set noswapfile
colorscheme default
"colorscheme molokai
"colorscheme tender
"colorscheme falcon
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
