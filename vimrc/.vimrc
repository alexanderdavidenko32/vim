"=============================================================================
"     FileName: .vimrc
"         Desc:
"       Author: Alexander Davidenko
"        Email: alexander.davidenko@concept-soft.com
"     HomePage: http://www.concept-soft.com
"      Version: 0.0.1
"   LastChange: 2013-08-21 11:16:06
"      History:
"=============================================================================
execute pathogen#infect()

filetype plugin on
filetype indent on

" ==============================================================================
" General settings
" ==============================================================================
set hlsearch
set incsearch
set mouse=a
set foldenable
set foldcolumn=1
syntax on

" Showing line numbers and length
set number " show line numbers
set tw=79 " width of document (used by gd)
set nowrap " don't automatically wrap on load
set fo-=t " don't automatically wrap text when typing
" To show vertical line uncomment below
set colorcolumn=80
"highlight ColorColumn ctermbg=233

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

" ==============================================================================
" Tab settings
" ==============================================================================
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set autoindent
"set smartindent
set cursorline

" Disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

"set wrap

" Automatic reloading of .vimrc
" powerline doesn't works
"autocmd! bufwritepost .vimrc source %

"chars
"set list
set listchars=eol:↲,tab:→→,trail:↔,nbsp:·,

" shared clipboard
"set clipboard=unnamed

" multicursors
let g:multi_cursor_next_key='<C-l>'

" syntastic
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_html_checkers = ['w3']

" ctrlp
" search for git repo
let g:ctrlp_working_path_mode = 'r'
" open file in new tab
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }
" ignore target directory
let g:ctrlp_custom_ignore = {
  \ 'dir':  'target',
  \ }
" git gutter
let g:gitgutter_eager=0


" ==============================================================================
" Status bar
" ==============================================================================
" airline settings

"let g:airline_powerline_fonts=0
"" to use solarized theme just comment below
"let g:airline_theme='powerlineish'


"let g:airline_detect_paste=1
"let g:airline#extensions#paste#symbol = 'ρ'
"let g:airline#extens
" syntastic
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_html_checkers = ['w3']
" ==============================================================================
" Status bar
" ==============================================================================
" airline settings

"let g:airline_powerline_fonts=0
"" to use solarized theme just comment below
"let g:airline_theme='powerlineish'


"let g:airline_detect_paste=1
"let g:airline#extensions#paste#symbol = 'ρ'
"let g:airline#extensions#whitespace#symbol = 'Ξ'

"let g:airline_left_sep = '⮀'
"let g:airline_left_alt_sep = '⮁'
"let g:airline_right_sep = '⮂'
"let g:airline_right_alt_sep = '⮃'
""let g:airline#extensions#branch#symbol = '⎇  '
"let g:airline#extensions#branch#symbol = '⭠ '
"let g:airline#extensions#readonly#symbol = '⭤'
"let g:airline_linecolumn_prefix = '⭡'
"let g:airline#extensions#tagbar#enabled = 1

" powerline
set timeout ttimeoutlen=50
let g:Powerline_symbols = 'fancy'
"let g:Powerline_colorscheme = 'solarized256'
"let g:Powerline_stl_path_style = 'full'
" old status bar
"set statusline=%f%m%r%h%w\ %y\ enc:%{&enc}\ ff:%{&ff}\ fenc:%{&fenc}%=(ch:%3b\ hex:%2B)\ col:%2c\ line:%2l/%L\ [%2p%%]
set laststatus=2   " always show status line

" langmap for russian spells
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

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

" ==============================================================================
" NERDTree Settings
" ==============================================================================
let NERDTreeShowHidden=1
let NERDTreeCaseSensitiveSort=1

" ==============================================================================
"  Hotkeys
" ==============================================================================

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

" F7 - author info refresh
nmap <F7> :AuthorInfoDetect<cr>

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

autocmd FileType javascript setlocal omnifunc=nodejscomplete#CompleteJS
" CTRL+Space omnicomplete
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o>"
imap <C-@> <C-Space>

" ==============================================================================
" emmet/zen coding
" ==============================================================================
"
" zen coding expand abbreviature
let g:user_emmet_expandabbr_key='<C-e>'

" <c-y>+j - split-join tag
let g:user_emmet_splitjointag_key='<C-j>'

" nerdtree settings
let NERDTreeShowBookmarks=1

" ==============================================================================
" syntastic
" ==============================================================================
" :lnext - next error
" :leprevious - prev error
nmap <leader>n :lnext<CR>
nmap <leader>N :lprevious<CR>

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
let g:tagbar_statusline_hook   = 'call Pl#UpdateStatusline(0)'
let g:tagbar_leave_hook        = 'call Pl#UpdateStatusline(0)'
let g:tagbar_dstwin_enter_hook = 'call Pl#UpdateStatusline(1)'


" diff current file with saved file
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

let g:vimrc_author='Alexander Davidenko'
let g:vimrc_email='alexander.davidenko@concept-soft.com'
let g:vimrc_homepage='http://www.concept-soft.com'

"let g:snippets_dir = "~/.vim/snippets"
" ==============================================================================
" Useful shortcuts
" ==============================================================================
" J - merge lines
" ysiw" : Hello world => "Hello" world
" cs"' : "Hello" world => 'Hello' world
" ds' : 'Hello' world => Hello world
" vlllS' : Hello => 'Hell'o
