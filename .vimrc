augroup MyAutoCmd
  autocmd!
augroup END

set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8                        " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別、左側が優先
set fileformats=mac,unix,dos                  " 改行コードの自動判別
set ambiwidth=double                          "四角や丸文字が崩れる問題を解決
set expandtab                                 " タブ入力を複数の空白入力に置き換える
set tabstop=2
set softtabstop=2                             " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent
set smartindent                               " 改行時に前の行の構文をチェックして次の行のインデントを増減する
set shiftwidth=2
set incsearch                                 " 1文字入力ごとに検索
set ignorecase                                " 検索パターンに大文字小文字を区別しない
set smartcase                                 " 検索パターンに大文字を含んでいたら大文字小文字を区別
set hlsearch
set whichwrap=b,s,h,l,<,>,[,],~               " カーソルの左右移動で行末から次の行頭への移動が可能
set number
set wrap
set cursorline
set backspace=indent,eol,start                " バックスペースキーの有効化
set showmatch                                 " 括弧の対応関係を一瞬表示する
set matchtime=3                               " 対応括弧のハイライト表示を3秒にする
set wildmenu                                  " コマンドモードの補完
set history=5000
set synmaxcol=200
set pumheight=10

" ==== nnoremap ====
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR> " ESCキー2度押しでハイライトの切り替え
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
nnoremap + <C-a>
nnoremap - <C-x>
inoremap <silent> jj <ESC> " bind esc to jj

source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する

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

	function! XTermPasteBegin(ret)
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
    NeoBundle 'scrooloose/nerdtree'
    NeoBundle 'plasticboy/vim-markdown'
    NeoBundle 'mzlogin/vim-markdown-toc'
    NeoBundle 'kannokanno/previm'
    NeoBundle 'tyru/open-browser.vim'
    NeoBundle 'tomasr/molokai'
    NeoBundle 'ayu-theme/ayu-vim'
    NeoBundle 'haishanh/night-owl.vim'
    NeoBundle 'jdkanani/vim-material-theme'
    NeoBundle 'jacoborus/tender'
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
    NeoBundle 'simeji/winresizer'
    NeoBundle 'w0rp/ale'
    NeoBundle 'Shougo/unite.vim'
    NeoBundle 'Shougo/vimfiler'
    "NeoBundle 'fatih/vim-go'
    "NeoBundle 'vim-jp/vim-go-extra'
    NeoBundle 'majutsushi/tagbar'  " Neobundleでインストール
    NeoBundle 'szw/vim-tags'
    NeoBundle 'elzr/vim-json'
    NeoBundle 'SirVer/ultisnips'
    NeoBundle 'leafgarland/typescript-vim'
    NeoBundle 'davidhalter/jedi-vim'
    NeoBundle 'neomake/neomake'
    NeoBundle 'tell-k/vim-autopep8'
    NeoBundle 'jparise/vim-graphql'
    NeoBundle 'mattn/benchvimrc-vim'
    NeoBundle 'tpope/vim-fugitive'
    NeoBundle 'ujihisa/unite-colorscheme'
    NeoBundle 'flazz/vim-colorschemes'
    NeoBundle 'stephpy/vim-yaml'
    NeoBundle 'shougo/neocomplete.vim'
    NeoBundle 'Shougo/neocomplcache'
    NeoBundle 'Shougo/neosnippet'
    NeoBundle 'Shougo/neosnippet-snippets'
    NeoBundle 'Shougo/dein.vim'
    NeoBundle 'chase/vim-ansible-yaml'
    NeoBundle 'ryanoasis/vim-devicons'
    NeoBundle 'dhruvasagar/vim-table-mode'
    NeoBundle 'vim-airline/vim-airline'
    NeoBundle 'vim-airline/vim-airline-themes'
    NeoBundle 'ctrlpvim/ctrlp.vim'
    NeoBundle 'wadackel/vim-dogrun'
    NeoBundle 'cocopon/iceberg.vim'
    NeoBundle 'vim-python/python-syntax'
    NeoBundle 'morhetz/gruvbox'
    NeoBundle 'w0ng/vim-hybrid'
"-------------------NeoBundle end-----------------------------------
    call plug#begin()
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
    call plug#end()
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
         " Vim起動時にneocompleteを有効にする
      let g:neocomplete#enable_at_startup = 1
      " smartcase有効化. 大文字が入力されるまで大文字小文字の区別を無視する
      let g:neocomplete#enable_smart_case = 1
      " 3文字以上の単語に対して補完を有効にする
      let g:neocomplete#min_keyword_length = 3
      " 区切り文字まで補完する
      let g:neocomplete#enable_auto_delimiter = 1
      " 1文字目の入力から補完のポップアップを表示
      let g:neocomplete#auto_completion_start_length = 1
      " バックスペースで補完のポップアップを閉じる
      inoremap <expr><BS> neocomplete#smart_close_popup()."<C-h>"

      " エンターキーで補完候補の確定. スニペットの展開もエンターキーで確定・・・・・・②
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

" =================
" molokaiの設定
" ================
hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c
set t_Co=256

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
autocmd ColorScheme * highlight LineNr ctermfg=239
set background=dark
"if &term == "xterm-256color"
"    colorscheme molokai
"    hi Comment ctermfg=102
"    hi Visual  ctermbg=236
"endif

filetype plugin indent on
syntax enable
let g:python_highlight_all = 1
"syntax on

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
" ======== colorscheme =========
"colorscheme molokai
"colorscheme night-owl
"colorscheme ayu
"colorscheme dogrun
"colorscheme material-theme
"colorscheme solarized
"colorscheme tender
" colorscheme falcon
"colorscheme iceberg
colorscheme gruvbox
let g:gruvbox_contrast = "soft"
let g:gruvbox_contrast_dark = "soft"

highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none


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

" =============== Markdown =========================
autocmd BufRead,BufNewFile *.{mkd,md} set filetype=markdown
autocmd! FileType markdown hi! def link markdownItalic Normal
autocmd FileType markdown set commentstring=<\!--\ %s\ -->

" for plasticboy/vim-markdown
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:table_mode_corner = '|'

nnoremap <silent><C-l> :NERDTreeToggle<CR>
let NERDTreeWinSize=20
let g:winresizer_vert_resize = 1
let g:winresizer_horiz_resize = 1
let g:toggle_window_size = 0
function! ToggleWindowSize()
  if g:toggle_window_size == 1
    exec "normal \<C-w>="
    let g:toggle_window_size = 0
  else
    :resize
    :vertical resize
    let g:toggle_window_size = 1
  endif
endfunction
set nocompatible              " be iMproved, required
"filetype off                  " required
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif
let g:go_fmt_command = "goimports"
let g:go_addtags_transform = "camelcase"
let g:go_auto_type_info=1
command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
    if 0 == a:0
        let l:arg = "."
    else
        let l:arg = a:1
    endif
    execute "%! jq \"" . l:arg . "\""
endfunction

" tagbar の設定
let g:tagbar_width = 25        " 初期設定はwidth=40なのでちょっと幅とりすぎ。
let g:tagbar_autoshowtag = 1   ":TagbarShowTag を叩かなくても有効にする
" ステータスラインの参考 %{tagbar#currenttag('[%s]','')} がタグを表示している部分
set statusline=%F%m%r%h%w\%=%{tagbar#currenttag('[%s]','')}\[Pos=%v,%l]\[Len=%L]

nmap <F8> :TagbarToggle<CR>

" vim-tags
au BufNewFile,BufRead *.php let g:vim_tags_project_tags_command = "ctags --languages=php -f ~/php.tags `pwd` 2>/dev/null &"

" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>

" 保存時のみ実行する
let g:ale_lint_on_text_changed = 0
" 表示に関する設定
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:airline#extensions#ale#open_lnum_symbol = '('
let g:airline#extensions#ale#close_lnum_symbol = ')'
let g:ale_echo_msg_format = '[%linter%]%code: %%s'
highlight link ALEErrorSign Tag
highlight link ALEWarningSign StorageClass
" Ctrl + kで次の指摘へ、Ctrl + jで前の指摘へ移動
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" --------------------------------
" syntastic
" --------------------------------
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"

autocmd FileType go :highlight goErr cterm=bold ctermfg=214
autocmd FileType go :match goErr /\<err\>/

let g:go_gocode_propose_source = 0
let g:go_template_autocreate = 0
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1

nnoremap <C-g>tj :GoAddTags<Enter>
nnoremap <C-g>tx :GoAddTags xml<Enter>
nnoremap <C-g>td :GoAddTags dynamo<Enter>
nnoremap <C-g>tda :GoRemoveTags<Enter>
nnoremap <C-g>tdj :GoRemoveTags json<Enter>
nnoremap <C-g>tdx :GoRemoveTags xml<Enter>
nnoremap <C-g>tdd :GoRemoveTags dynamo<Enter>
nnoremap <C-g>e :GoIfErr<Enter>
nnoremap <C-g>d :GoDoc<Enter>
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
let g:go_addtags_transform = "camelcase"

let mapleader = ","
let g:go_list_type = "quickfix"

let g:go_fmt_command = "goimports"

let g:jedi#auto_vim_configuration = 0

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif

function! Preserve(command)
    " Save the last search.
    let search = @/
    " Save the current cursor position.
    let cursor_position = getpos('.')
    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)
    " Execute the command.
    execute a:command
    " Restore the last search.
    let @/ = search
    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt
    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction

if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif


" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {}
    \ }

" use a custom markdown style must be absolute path
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" guifontを設定しないと文字化けになる。terminalで行ったフォントの設定と同様
" 公式サイトではLinuxとmacOSの設定が若干異なるが、Linuxの設定でもmacOSで問題なし
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
set encoding=utf-8

" フォルダアイコンを表示
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif
set guifont=Cica:h16
set printfont=Cica:h12
set ambiwidth=double
" フォルダアイコンの表示をON
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" ----------
" markdown-preview.vim setting
" ----------
nnoremap <silent> ;;p :MarkdownPreview<CR> " ;;pでプレビュー

let g:table_mode_corner = '|'

" -------
" airline
" -------
let g:airline_theme = 'wombat'
set laststatus=2
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'y', 'z']]
let g:airline_section_c = '%t'
let g:airline_section_x = '%{&filetype}'
let g:airline_section_z = '%3l:%2v %{airline#extensions#ale#get_warning()} %{airline#extensions#ale#get_error()}'
let g:airline#extensions#ale#error_symbol = ' '
let g:airline#extensions#ale#warning_symbol = ' '
let g:airline#extensions#default#section_truncate_width = {}
let g:airline#extensions#whitespace#enabled = 1

augroup QfAutoCommands
  autocmd!

  " Auto-close quickfix window
  autocmd WinEnter * if (winnr('$') == 1) && (getbufvar(winbufnr(0), '&buftype')) == 'quickfix' | quit | endif
augroup END

call plug#begin('~/.vim/plugged')
  Plug 'prabirshrestha/async.vim'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
  Plug 'prabirshrestha/vim-lsp'
  Plug 'mattn/vim-lsp-settings'
  Plug 'mattn/vim-goimports'
call plug#end()

nnoremap <silent> gd :LspDefinition<CR>
nnoremap <silent> gvd :vs \| :LspDefinition<CR>
nnoremap <silent> gsd :sp \| :LspDefinition<CR>
nnoremap <silent> gh :LspHover<CR>
nnoremap <silent> gi :LspImplementation<CR>
nnoremap <silent> gen :LspNextError<CR>
nnoremap <silent> gep :LspPreviousError<CR>

"if empty(globpath(&rtp, 'autoload/lsp.vim'))
"  finish
"endif
"
"function! s:on_lsp_buffer_enabled() abort
"  setlocal omnifunc=lsp#complete
"  setlocal signcolumn=yes
"  nmap <buffer> gd <plug>(lsp-definition)
"  nmap <buffer> <f2> <plug>(lsp-rename)
"  inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
"endfunction
"
"augroup lsp_install
"  au!
"  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
"augroup END
"command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')
"
"let g:lsp_diagnostics_enabled = 1
"let g:lsp_diagnostics_echo_cursor = 1
"let g:asyncomplete_auto_popup = 1
"let g:asyncomplete_auto_completeopt = 0
"let g:asyncomplete_popup_delay = 200
"let g:lsp_text_edit_enabled = 1

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'

"Plug 'hrsh7th/vim-vsnip'
"Plug 'hrsh7th/vim-vsnip-integ'


function! s:get_syn_id(transparent)
  let synid = synID(line("."), col("."), 1)
  if a:transparent
    return synIDtrans(synid)
  else
    return synid
  endif
endfunction
function! s:get_syn_attr(synid)
  let name = synIDattr(a:synid, "name")
  let ctermfg = synIDattr(a:synid, "fg", "cterm")
  let ctermbg = synIDattr(a:synid, "bg", "cterm")
  let guifg = synIDattr(a:synid, "fg", "gui")
  let guibg = synIDattr(a:synid, "bg", "gui")
  return {
        \ "name": name,
        \ "ctermfg": ctermfg,
        \ "ctermbg": ctermbg,
        \ "guifg": guifg,
        \ "guibg": guibg}
endfunction
function! s:get_syn_info()
  let baseSyn = s:get_syn_attr(s:get_syn_id(0))
  echo "name: " . baseSyn.name .
        \ " ctermfg: " . baseSyn.ctermfg .
        \ " ctermbg: " . baseSyn.ctermbg .
        \ " guifg: " . baseSyn.guifg .
        \ " guibg: " . baseSyn.guibg
  let linkedSyn = s:get_syn_attr(s:get_syn_id(1))
  echo "link to"
  echo "name: " . linkedSyn.name .
        \ " ctermfg: " . linkedSyn.ctermfg .
        \ " ctermbg: " . linkedSyn.ctermbg .
        \ " guifg: " . linkedSyn.guifg .
        \ " guibg: " . linkedSyn.guibg
endfunction
command! SyntaxInfo call s:get_syn_info()

