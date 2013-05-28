filetype plugin on

"general settings
set number
set hlsearch
set incsearch
set mouse=a
set foldenable
set foldcolumn=1
syntax on

"colorscheme settings
"important: colorscheme settings should be after 'syntax on' setting
set background=dark
set t_Co=256
set t_ut=
let g:solarized_termcolors=256
"let g:solarized_termtrans=1
colorscheme solarized

"format settings
"set wrapmargin=1
"set textwidth=1
set showbreak=->

"tab settings
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set autoindent
set smartindent
set cursorline
set noswapfile
"set wrap

"chars
"set list
set listchars=eol:↲,tab:→→,trail:↔,nbsp:·,

" shared clipboard
"set clipboard=unnamed

"status bar
" powerline
set timeout ttimeoutlen=50
let g:Powerline_symbols = 'fancy'
"let g:Powerline_colorscheme = 'solarized256'
"let g:Powerline_stl_path_style = 'full'

" langmap for russian spells
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

set laststatus=2   " always show status line
" old status bar
"set statusline=%f%m%r%h%w\ %y\ enc:%{&enc}\ ff:%{&ff}\ fenc:%{&fenc}%=(ch:%3b\ hex:%2B)\ col:%2c\ line:%2l/%L\ [%2p%%]

" highlight trailing spaces
au BufNewFile,BufRead * let b:mtrailingws=matchadd('ErrorMsg', '\s\+$', -1)

" remove trailing spaces
autocmd BufWritePre * :%s/\s\+$//e

" cursor in last edit position
if has("autocmd")
    set viewoptions=cursor,folds
    au BufWinLeave ?* mkview
    au BufWinEnter ?* silent loadview
endif

" For local replace
nnoremap gr gd[{V%:s/<C-R>///gc<left><left><left>

"NERDTree Settings
let NERDTreeShowHidden=1
let NERDTreeCaseSensitiveSort=1

"Hotkeys

" remove annoing Ex mode prompt
map Q <Nop>

" F2 - save file
nmap <F2> :w<cr>
vmap <F2> <esc>:w<cr>i
imap <F2> <esc>:w<cr>i

" F3 - paste toggle for autoident
set pastetoggle=<F3>

" F4 - open new tab
imap <F4> <Esc>:NERDTreeToggle<CR>
map <F4> <Esc>:NERDTreeToggle<CR>

" F5 - open new tab
"imap <F5> <Esc>:browse tabnew<CR>
"map <F5> <Esc>:browse tabnew<CR>

" F5 - previous tab
imap <F5> <Esc> :tabprev <CR>i
map <F5> :tabprev <CR>

" F6 - next tab
imap <F6> <Esc> :tabnext <CR>i
map <F6> :tabnext <CR>

" F8 - tagbar
nnoremap <silent> <F8> :TagbarToggle<CR>

" F9 - user menu set encoding
"Convert file encoding
set wildmenu
set wcm=
menu SetEnc.cp1251 :set fenc=cp1251<CR>
menu SetEnc.koi8-r :set fenc=koi8-r<CR>
menu SetEnc.cp866 :set fenc=ibm866<CR>
menu SetEnc.utf-8 :set fenc=utf-8<CR>
map <F9> :emenu SetEnc.<Tab>

" F12 - user menu with encoding
set wildmenu
set wcm=<Tab>
menu Encoding.cp1251  :e ++enc=cp1251<CR>
menu Encoding.koi8-r  :e ++enc=koi8-r<CR>
menu Encoding.cp866   :e ++enc=cp866<CR>
menu Encoding.ucs-2le :e ++enc=ucs-2le<CR>
menu Encoding.utf-8   :e ++enc=utf-8<CR>
map <F12> :emenu Encoding.<Tab>

" copy on Ctrl+C to X clipboard
vmap <C-C> "+yi

" CTRL+Space omnicomplete
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o>"
imap <C-@> <C-Space>

" zen coding part
"
" zen coding expand abbreviature
let g:user_zen_expandabbr_key='<C-e>'

" <c-y>+j - split-join tag
let g:user_zen_splitjointag_key='<C-j>'

" nerdtree settings
let NERDTreeShowBookmarks=1

" Align text
"if exists(":Tabularize")
  nmap <Leader>t= :Tabularize /=<CR>
  vmap <Leader>t= :Tabularize /=<CR>
  nmap <Leader>t:= :Tabularize /:=<CR>
  vmap <Leader>t:= :Tabularize /:=<CR>
  nmap <Leader>t: :Tabularize /:<CR>
  vmap <Leader>t: :Tabularize /:<CR>
"endif

" tagbar autofocus
let tagbar_autofocus = 1
" Automatically close tagbar window when choosing a tag
let tagbar_autoclose = 1
let g:tagbar_statusline_hook = 'call Pl#UpdateStatusline(0)'
let g:tagbar_leave_hook = 'call Pl#UpdateStatusline(0)'
let g:tagbar_dstwin_enter_hook = 'call Pl#UpdateStatusline(1)'

""""""""""""""
" tmux fixes "
""""""""""""""
" Handle tmux $TERM quirks in vim
"if $TERM =~ '^screen-256color'
    "map <Esc>OH <Home>
    "map! <Esc>OH <Home>
    "map <Esc>OF <End>
    "map! <Esc>OF <End>
"endif
" J - merge lines
" ysiw" : Hello world => "Hello" world
" cs"' : "Hello" world => 'Hello' world
" ds' : 'Hello' world => Hello world
" vlllS' : Hello => 'Hell'o
