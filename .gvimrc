" ■GUIオプション
set guioptions-=T " ツールバーを非表示にする
set guioptions+=a " yでコピーした時にクリップボードに入る
"set guioptions-=m " メニューバーを非表示にする
"set guioptions+=R " 右スクロールバーを非表示

set cursorline " 現在の行を強調表示

" --------------------------------------------------------------------------------
" Font
" --------------------------------------------------------------------------------

set guifont=Ricty_Diminished_for_Powerline:h14
set guifontwide=Ricty_Diminished_for_Powerline:h14

set hlsearch " 検索語をハイライト表示
nmap <Esc><Esc> :nohlsearch<CR>"<Esc> " ESC連打でハイライト解除

syntax enable
set background=dark
colorscheme solarized

