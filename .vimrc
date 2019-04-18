set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別、左側が優先
set fileformats=mac,unix,dos " 改行コードの自動判別
set ambiwidth=double "四角や丸文字が崩れる問題を解決
set expandtab " タブ入力を複数の空白入力に置き換える
set tabstop=4
set softtabstop=4 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent
set smartindent " 改行時に前の行の構文をチェックして次の行のインデントを増減する
set shiftwidth=4
set incsearch " 1文字入力ごとに検索

set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別
set hlsearch
" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

" カーソルの左右移動で行末から次の行頭への移動が可能
set whichwrap=b,s,h,l,<,>,[,],~
set number
set cursorline
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
" バックスペースキーの有効化
set backspace=indent,eol,start

set showmatch " 括弧の対応関係を一瞬表示する
" source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する

" コマンドモードの補完
set wildmenu
set history=5000

" マウスの有効化
if has('mouse')
	set mouse=a
	if has('mouse_sgr')
		set ttymouse=sgr
	elseif v:version > 703 || v:version is 703 && has('patch632')
		set ttymouse=sgr
	else
		set ttymouse=xterm2
	endif
endif

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
"----------------------------------------------------------
"ここに追加したいVimプラグインを記述する・・・・・・②
    NeoBundle 'scrooloose/nerdtree'
    NeoBundleFetch 'Shougo/neobundle.vim'
    NeoBundle 'plasticboy/vim-markdown'
    NeoBundle 'kannokanno/previm'
    NeoBundle 'tyru/open-browser.vim'
    NeoBundle 'tomasr/molokai'
    NeoBundle 'fenetikm/falcon'
    NeoBundle 'altercation/vim-colors-solarized'
    NeoBundle 'vim-jp/cpp-vim'
    NeoBundle 'itchyny/lightline.vim'
    NeoBundle 'bronson/vim-trailing-whitespace'
    NeoBundle 'ConradIrwin/vim-bracketed-paste'
    NeoBundle 'Yggdroot/indentLine'
    NeoBundle 'ctrlpvim/ctrlp.vim' " 多機能セレクタ
    NeoBundle 'tacahiroy/ctrlp-funky' " CtrlPの拡張プラグイン、関数検索
    NeoBundle 'suy/vim-ctrlp-commandline' " CtrlPの拡張プラグイン、コマンド履歴検索
    NeoBundle 'rking/ag.vim'
    "NeoBundle 'scrooloose/syntastic' " 構文エラーチェック
"----------------------------------------------------------

    if has('lua')
        NeoBundle 'shougo/neocomplete.vim'
        NeoBundle 'Shougo/neosnippet'
        NeoBundle 'Shougo/neosnippet-snippets'
    endif

    set nocompatible
    filetype off
    if has('vim_starting')
        set runtimepath+=~/.vim/bundle/neobundle.vim
    endif


    filetype plugin indent on

    " ==================
    " CtrP設定
    " ==================
    let g:ctrlp_math_window = 'order:ttb,min:20,max:20,results:100' " マッチウィンドウの設定、「下部に表示、大きさ20行で固定、検索結果100件」
    let g:ctrlp_show_hidden = 1 "ドットファイルも検索対象
    let g:ctrlp_types = ['fil'] " ファイル検索のみ使用
    let g:ctrlp_extensions = ['funky', 'commandline'] " CtrlPの拡張として「funky」と「commandline」を使用

    " CtrlPCommandLineを有効
    command! CtrlPCommandLine call ctralp#init(ctrlp#commandline#id())

    "CtrlPFunkyの有効化
    let g:ctrlp_funky_matchtype = 'path'

    " ==================
    " Syntasticの設定
    " ==================
    "let g:syntastic_enable_signs = 1 " 構文エラー業に>>を表示
    "let g:syntastic_always_populate_loc_list = 1 "他のvimプラグインと競合するのを防ぐ
    "let g:syntastic_auto_loc_list = 0 "構文エラーリストを非表示
    "let g:syntastic_check_on_open = 1 " ファイルを開いたときに構文エラーチェックを実行
    "let g:syntastic_check_on_wq = 1 " [:wq]で終了するときも構文エラーチェック

    " ==================
    " ag.vimの設定
    " ==================
    if executable('ag')
        let g:ctrlp_use_caching=0 " CtrlPのキャッシュを使わない
        let g:ctrlp_user_command='ag %s -i --hiden -g ""' "agの検索設定
    endif


    " ==================
    " neocomplete neosnippetの設定
    " ==================
    if neobundle#is_installed('neocomplete.vim')
        " vim起動時にneocompleteを有効にする
        let g:neocomplete#enable_at_startup = 1
        " smartcase有効化、大文字が入力されるまで大文字小文字の区別を無視する
        let g:neocomplete#enable_smart_case = 1
        " 3文字以上の単語に対して補完を有効にする
        let g:neocomplete#min_keyword_length = 3
        " 区切り文字まで補完する
        let g:neocomplete#enable_auto_delimiter = 1
        " 1文字目の入力から補完のポップアップを表示
        let g:neocomplete#auto_completion_start_length = 1
        " バックスペースで補完のポップアップを閉じる
        inoremap <expr><BS> neocomplete#smart_close_popup()."<C-h>"

        " エンターキーで補完候補の確定、スニペットの展開もエンターキーで確定
        imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"
        " タブキーで補完候補の選択. スニペット内のジャンプもタブキーでジャンプ・・・・・・③
        imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"
     endif




"----------------------------------------------------------
call neobundle#end()
"ファイルタイプ別のVimプラグイン/インデントを有効にする
filetype plugin indent on
"未インストールのVimプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定・・・・・・③
NeoBundleCheck

" set term=xterm-256color
" =================
" molokaiの設定
" ================
syntax on
hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c
set t_Co=256

if neobundle#is_installed('molokai')
    set background=dark
    colorscheme molokai
    " colorscheme solarized
    " colorscheme molokai
    " colorscheme tender
    " colorscheme falcon
endif


" ====================
" ステータスラインの設定
" ====================
set laststatus=2 " ステータスラインを常に表示
set showmode " 現在のモードを表示
set showcmd " 打ったコマンドをステータスラインの下に表示
set ruler " ステータスラインの右側にカーソルの現在位置を表示する


autocmd ColorScheme * highlight LineNr ctermfg=226
"
"" htmlタグの補完
augroup MyXML
	autocmd!
	autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
	autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END
set nobackup
set noswapfile
" texのconcealを無効化
let g:tex_conceal=''
""" markdown {{{
    autocmd BufRead,BufNewFile *.mkd  set filetype=markdown
    autocmd BufRead,BufNewFile *.md  set filetype=markdown
    " Need: kannokanno/previm
    nnoremap <silent> <C-a> :PrevimOpen<CR>
    " Ctrl-pでプレビュー
    " 自動で折りたたまないようにする
    let g:vim_markdown_folding_disabled=1
" }}}

if &term =~ "xterm"
    let &t_ti .= "\e[?2004h"
    let &t_te .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
    cnoremap <special> <Esc>[200~ <nop>
    cnoremap <special> <Esc>[201~ <nop>
endif

nnoremap <silent><C-e> :NERDTreeToggle<CR>
