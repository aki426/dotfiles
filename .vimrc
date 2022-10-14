" --------------------------------------------------------------------------------
" �v���O�C��
" --------------------------------------------------------------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" ******************** ���[�e�B���e�B ********************
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
set hidden " �o�b�t�@���ҏW���ł����̑��̃t�@�C�����J����悤�ɂ���
" swap�t�@�C���Ȃǂ��u��
set directory=~/vimfiles/swap
set backupdir=~/vimfiles/back
set undodir=~/vimfiles/undo
set viminfo+=n~/vimfiles/_viminfo
" �^�u����
set tabstop=2
set expandtab
set shiftwidth=2
" �ʒu�\���n
set number
set cursorline " ���݂̍s�������\��
" �J�b�R�Ή�
set showmatch

let mapleader = ","

" ���W�X�^�������Ȃ�
" �폜�̂�
vnoremap d "xd
nnoremap d "xd
vnoremap D "xD
nnoremap D "xD
vnoremap x "xx
nnoremap x "xx
vnoremap s "xs
nnoremap s "xs

" �؂���
" nnoremap t d
" vnoremap t x
" nnoremap tt dd
" nnoremap T D

" �n�C���C�g�A�u���֌W
set hlsearch " ��������n�C���C�g�\��
" �n�C���C�g����
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l> 
" �J�[�\�����̒P����n�C���C�g
nnoremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>
" �J�[�\�����̒P����n�C���C�g���Ă���u���\��Ԃɂ���
nmap # <Space><Space>:%s/<C-r>///g<Left><Left>

" �o�b�t�@�ړ�
nnoremap <silent> <C-PageDown> :bprev<CR>
nnoremap <silent> <C-PageUp> :bnext<CR>
" nmap <C-Tab> :tabnext<CR>
" nmap <C-S-Tab> :tabprevious<CR> 
nnoremap <silent> <C-Tab> :bnext<CR>
nnoremap <silent> <C-S-Tab> :bprev<CR>

" �⊮��t�@�C���̐ݒ�
" �p�P�����������⊮�ꂩ��O��
autocmd FileType scheme setlocal complete-=k
" Gauche�p�⊮��t�@�C���̐ݒ� �t�@�C�����͓K�X�ύX����
" ���W���[�����Ƃɕ⊮��t�@�C����������ꍇ�̗�
autocmd FileType scheme setlocal complete+=k~/.gosh_idx/*
" �p�P����A�v���O�����p�̕�Ԍ�̂��ƂɌ��ɂ���
" autocmd FileType scheme setlocal complete+=k/usr/share/dict/words

" --------------------------------------------------------------------------------
" supertab
" --------------------------------------------------------------------------------
let g:SuperTabDefaultCompletionType = "<c-n>" " Tab���������Ƃ��̈ړ������C��
" let g:SuperTabDefaultCompletionType = 'context' 

" --------------------------------------------------------------------------------
" For scheme 
" --------------------------------------------------------------------------------
" �⊮��̎��W�Ώۂ�Scheme�ɍ��킹��
autocmd FileType scheme setlocal iskeyword=@,33,35-38,42-43,45-58,60-64,94,_,126
" 33 !
" 35-38 #$%&
" 42-43 *+
" 45-58 -./[0-9]:
" 60-64 <=>?@
" 94 ^
" 126 ~

" �s���ȊO��2�����󔒂�1�����󔒂ɒu��������
" %s/\(\S\)  \+/\1 /g

" --------------------------------------------------------------------------------
" vim-gdev,vim-goshrepl
" https://aharisu.hatenadiary.org/entry/20120430/1335762494
" https://aharisu.hatenadiary.org/entry/20120930/1349015233
" --------------------------------------------------------------------------------
":Unite gosh_info�����s���܂�
"nmap gi <Plug>(gosh_info_start_search)
"":Unite �J�[�\���ʒu�̃V���{���������l��:Unite gosh_info�����s���܂�
"nmap gk <Plug>(gosh_info_start_search_with_cur_keyword)
"imap <C-A> <Plug>(gosh_info_start_search_with_cur_keyword)

""ginfo�E�B���h�E�̃X�N���[���A�b�v�E�_�E��
"nmap <C-K> <Plug>(gosh_info_row_up)
"nmap <C-J> <Plug>(gosh_info_row_down)
"imap <C-K> <Plug>(gosh_info_row_up)
"imap <C-J> <Plug>(gosh_info_row_down)
""ginfo�E�B���h�E����܂�
"nmap <C-C> <Plug>(gosh_info_close)
"imap <C-C> <Plug>(gosh_info_close)

""�J�[�\���ʒu�̃V���{������`����Ă���ꏊ�ɃW�����v
"nmap <F12> <Plug>(gosh_goto_define)
"nmap <F11> <Plug>(gosh_goto_define_split)

"goshREPL���ŃV���^�b�N�X�⊮��L���ɂ���
"let g:neocomplcache_keyword_patterns['gosh-repl'] = "[[:alpha:]+*/@$_=.!?-][[:alnum:]+*/@$_:=.!?-]*"

" �I��͈͂����s
vmap <F8> <Plug>(gosh_repl_send_block)

" --------------------------------------------------------------------------------
" Restart
" --------------------------------------------------------------------------------
" �I�����ɕۑ�����Z�b�V�����I�v�V������ݒ肷��
let g:restart_sessionoptions
    \ = 'blank,buffers,curdir,folds,help,localoptions,tabpages'

" --------------------------------------------------------------------------------
" airline
" --------------------------------------------------------------------------------
set showtabline=2 " ��Ƀ^�u���C����\��
"set t_Co=256 " ���̐ݒ肪�Ȃ��ƐF���������\������Ȃ�
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
" let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1
set encoding=UTF-8

" --------------------------------------------------------------------------------
" SnipMate
" --------------------------------------------------------------------------------
let g:snipMate = { 'snippet_version' : 1 }


