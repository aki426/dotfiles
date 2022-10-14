" --------------------------------------------------------------------------------
" プラグイン
" --------------------------------------------------------------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" ******************** ユーティリティ ********************
Plugin 'airblade/vim-gitgutter'
Plugin 'tyru/restart.vim'
" Plugin 'Shougo/neocomplcache.vim'
Plugin 'Shougo/unite.vim'
Plugin 'preservim/nerdtree'
Plugin 'yuttie/comfortable-motion.vim' 
Plugin 'ervandew/supertab' 
Plugin 'easymotion/vim-easymotion'
" Plugin 'ujihisa/quickrun'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-commentary' 

" ******************** Snippet ********************
" Plugin 'honza/vim-snippets'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
 
" ******************** Gauche ********************
Plugin 'aharisu/vim_goshrepl'
Plugin 'aharisu/vim-gdev'
Plugin 'paredit.vim'
Plugin 'bhurlow/vim-parinfer'
Plugin 'amdt/vim-niji'

" ******************** Airline ********************
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" ******************** color scheme ********************
Plugin 'Wombat'
Plugin 'w0ng/vim-hybrid'
Plugin 'raphamorim/lucario'
Plugin 'jacoborus/tender.vim'
Plugin 'tomasr/molokai'
Plugin 'haishanh/night-owl.vim'
Plugin 'ghifarit53/tokyonight-vim'
Plugin 'drewtempelmeyer/palenight.vim'

call vundle#end()

filetype plugin indent on
syntax enable

" --------------------------------------------------------------------------------
" settings
" --------------------------------------------------------------------------------
set hidden " バッファが編集中でもその他のファイルを開けるようにする
" swapファイルなどを隔離
set directory=~/vimfiles/swap
set backupdir=~/vimfiles/back
set undodir=~/vimfiles/undo
set viminfo+=n~/vimfiles/_viminfo
" タブ周り
set tabstop=2
set expandtab
set shiftwidth=2
" 位置表示系
set number
set cursorline " 現在の行を強調表示
" カッコ対応
set showmatch

let mapleader = ","

" レジスタを汚さない
" 削除のみ
vnoremap d "xd
nnoremap d "xd
vnoremap D "xD
nnoremap D "xD
vnoremap x "xx
nnoremap x "xx
vnoremap s "xs
nnoremap s "xs

" 切り取り
" nnoremap t d
" vnoremap t x
" nnoremap tt dd
" nnoremap T D

" ハイライト、置換関係
set hlsearch " 検索語をハイライト表示
" ハイライト解除
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l> 
" カーソル下の単語をハイライト
nnoremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>
" カーソル下の単語をハイライトしてから置換可能状態にする
nmap # <Space><Space>:%s/<C-r>///g<Left><Left>

" バッファ移動
nnoremap <silent> <C-PageDown> :bprev<CR>
nnoremap <silent> <C-PageUp> :bnext<CR>
" nmap <C-Tab> :tabnext<CR>
" nmap <C-S-Tab> :tabprevious<CR> 
nnoremap <silent> <C-Tab> :bnext<CR>
nnoremap <silent> <C-S-Tab> :bprev<CR>

" 補完語ファイルの設定
" 英単語をいったん補完語から外す
autocmd FileType scheme setlocal complete-=k
" Gauche用補完語ファイルの設定 ファイル名は適宜変更する
" モジュールごとに補完語ファイルを作った場合の例
autocmd FileType scheme setlocal complete+=k~/.gosh_idx/*
" 英単語を、プログラム用の補間語のあとに候補にする
" autocmd FileType scheme setlocal complete+=k/usr/share/dict/words

" --------------------------------------------------------------------------------
" supertab
" --------------------------------------------------------------------------------
let g:SuperTabDefaultCompletionType = "<c-n>" " Tabを押したときの移動方向修正
" let g:SuperTabDefaultCompletionType = 'context' 

" --------------------------------------------------------------------------------
" For scheme 
" --------------------------------------------------------------------------------
" 補完語の収集対象をSchemeに合わせる
autocmd FileType scheme setlocal iskeyword=@,33,35-38,42-43,45-58,60-64,94,_,126
" 33 !
" 35-38 #$%&
" 42-43 *+
" 45-58 -./[0-9]:
" 60-64 <=>?@
" 94 ^
" 126 ~

" 行頭以外の2文字空白を1文字空白に置き換える
" %s/\(\S\)  \+/\1 /g

" --------------------------------------------------------------------------------
" vim-gdev,vim-goshrepl
" https://aharisu.hatenadiary.org/entry/20120430/1335762494
" https://aharisu.hatenadiary.org/entry/20120930/1349015233
" --------------------------------------------------------------------------------
":Unite gosh_infoを実行します
"nmap gi <Plug>(gosh_info_start_search)
"":Unite カーソル位置のシンボルを初期値に:Unite gosh_infoを実行します
"nmap gk <Plug>(gosh_info_start_search_with_cur_keyword)
"imap <C-A> <Plug>(gosh_info_start_search_with_cur_keyword)

""ginfoウィンドウのスクロールアップ・ダウン
"nmap <C-K> <Plug>(gosh_info_row_up)
"nmap <C-J> <Plug>(gosh_info_row_down)
"imap <C-K> <Plug>(gosh_info_row_up)
"imap <C-J> <Plug>(gosh_info_row_down)
""ginfoウィンドウを閉じます
"nmap <C-C> <Plug>(gosh_info_close)
"imap <C-C> <Plug>(gosh_info_close)

""カーソル位置のシンボルが定義されている場所にジャンプ
"nmap <F12> <Plug>(gosh_goto_define)
"nmap <F11> <Plug>(gosh_goto_define_split)

"goshREPL内でシンタックス補完を有効にする
"let g:neocomplcache_keyword_patterns['gosh-repl'] = "[[:alpha:]+*/@$_=.!?-][[:alnum:]+*/@$_:=.!?-]*"

" 選択範囲を実行
vmap <F8> <Plug>(gosh_repl_send_block)

" --------------------------------------------------------------------------------
" Restart
" --------------------------------------------------------------------------------
" 終了時に保存するセッションオプションを設定する
let g:restart_sessionoptions
    \ = 'blank,buffers,curdir,folds,help,localoptions,tabpages'

" --------------------------------------------------------------------------------
" airline
" --------------------------------------------------------------------------------
set showtabline=2 " 常にタブラインを表示
"set t_Co=256 " この設定がないと色が正しく表示されない
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
" let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1
set encoding=UTF-8

" --------------------------------------------------------------------------------
" SnipMate
" --------------------------------------------------------------------------------
let g:snipMate = { 'snippet_version' : 1 }


