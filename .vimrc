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

Plugin 'Shougo/neocomplcache.vim'
Plugin 'Shougo/unite.vim'

" ******************** Gauche ********************
Plugin 'aharisu/vim_goshrepl'
Plugin 'aharisu/vim-gdev'

Plugin 'luochen1990/rainbow'

" ******************** Airline ********************

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" ******************** color scheme ********************
"Plugin 'altercation/solarized'
Plugin 'Wombat'
Plugin 'w0ng/vim-hybrid'
Plugin 'raphamorim/lucario'
Plugin 'jacoborus/tender.vim'
Plugin 'tomasr/molokai'

call vundle#end()
filetype plugin indent on

" --------------------------------------------------------------------------------
" settings
" --------------------------------------------------------------------------------
set hidden " バッファが編集中でもその他のファイルを開けるように
" --------------------------------------------------------------------------------
" vim-gdev,vim-goshrepl
" https://aharisu.hatenadiary.org/entry/20120430/1335762494
" https://aharisu.hatenadiary.org/entry/20120930/1349015233
" --------------------------------------------------------------------------------
":Unite gosh_infoを実行します
nmap gi <Plug>(gosh_info_start_search)
":Unite カーソル位置のシンボルを初期値に:Unite gosh_infoを実行します
nmap gk <Plug>(gosh_info_start_search_with_cur_keyword)
imap <C-A> <Plug>(gosh_info_start_search_with_cur_keyword)

"ginfoウィンドウのスクロールアップ・ダウン
nmap <C-K> <Plug>(gosh_info_row_up)
nmap <C-J> <Plug>(gosh_info_row_down)
imap <C-K> <Plug>(gosh_info_row_up)
imap <C-J> <Plug>(gosh_info_row_down)
"ginfoウィンドウを閉じます
nmap <C-C> <Plug>(gosh_info_close)
imap <C-C> <Plug>(gosh_info_close)

"カーソル位置のシンボルが定義されている場所にジャンプ
nmap <F12> <Plug>(gosh_goto_define)
nmap <F11> <Plug>(gosh_goto_define_split)

"goshREPL内でシンタックス補完を有効にする
"let g:neocomplcache_keyword_patterns['gosh-repl'] = "[[:alpha:]+*/@$_=.!?-][[:alnum:]+*/@$_:=.!?-]*"
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
let g:airline_theme='light'
let g:airline_powerline_fonts = 0

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>

set tabstop=2
set expandtab
set shiftwidth=2
set number
set cursorline " 現在の行を強調表示

"" neocomplcache
" https://qiita.com/hide/items/229ff9460e75426a2d07
"NeoBundle 'Shougo/neocomplcache'
" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
	\ 'default' : '',
	\ 'vimshell' : $HOME.'/.vimshell_hist',
  \ 'scheme' : $HOME.'/.gosh_completions'
  \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

