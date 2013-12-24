"=============================================================================
"     FileName: .vimrc
"         Desc:
"       Author: Alexander Davidenko
"        Email: alexander.davidenko@concept-soft.com
"     HomePage: http://www.concept-soft.com
"      Version: 0.0.1
"   LastChange: 2013-12-20 10:24:25
"      History:
"=============================================================================
" run pathogen
execute pathogen#infect()

filetype plugin on
filetype indent on

" ==============================================================================
" General settings
" ==============================================================================

" select by mouse in all modes
set mouse=a

" Open all folds while set.
set foldenable

" Display Line numbers
set number

" Disable wrapping long string
set nowrap

" Width of document (used by gd)
set tw=79

" To show vertical line uncomment below
set colorcolumn=80

"colorscheme settings
"important: colorscheme settings should be after 'syntax on' setting
set background=dark

" terminal colors
set t_Co=256
set t_ut=

" Enable display whitespace characters
set list

" Setting up how to display whitespace characters
set listchars=tab:→→,trail:↔,nbsp:·,


"format settings
set showbreak=->

"set smartindent
set cursorline

" ==============================================================================
" Solarized
" ==============================================================================

" terminal colors for solarized colorcheme
" important: should be before colorcheme
let g:solarized_termcolors=256

" Colorcheme
colorscheme solarized

" ==============================================================================
" Tab settings
" ==============================================================================

" Copy indent from previous line
set autoindent

" Enable smart indent. it add additional indents whe necessary
set smartindent

" Replace tabs with spaces
set expandtab

" Whe you hit tab at start of line, indent added according to shiftwidth value
set smarttab

" number of spaces to use for each step of indent
set shiftwidth=4

" Number of spaces that a Tab in the file counts for
set tabstop=4

" Same but for editing operation (not shure what exactly does it means)
" but in most cases tabstop and softtabstop better be the same
set softtabstop=4

" Round indent to multiple of 'shiftwidth'.
" Indentation always be multiple of shiftwidth
" Applies to < and > command
set shiftround

" ==============================================================================
" Search options
" ==============================================================================

" Highlight search results
set hlsearch

" Ignore case in search patterns
set ignorecase

" Override the 'ignorecase' option if the search patter ncontains upper case characters
set smartcase

" Live search. While typing a search command, show where the pattern
set incsearch

" Disable higlighting search result on Enter key
nnoremap <silent> <cr> :nohlsearch<cr><cr>

" Show matching brackets
set showmatch

" Make < and > match as well
set matchpairs+=<:>

" ==============================================================================
" Edit
" ==============================================================================

" Add '-' as recognized word symbol. e.g dw delete all 'foo-bar' instead just 'foo'
set iskeyword+=-

" ==============================================================================
" Backup
" ==============================================================================

" Disable backups file
set nobackup

" Disable vim common sequense for saving.
" By defalut vim write buffer to a new file, then delete original file
" then rename the new file.
set nowritebackup

" Disable swp files
set noswapfile

" ==============================================================================
" multicursors
" ==============================================================================

" Set hotkey for next selection
let g:multi_cursor_next_key='<C-l>'

" ==============================================================================
" syntastic
" ==============================================================================

" set woking mode for syntastic
let g:syntastic_mode_map = { 'mode': 'passive',
                            \ 'active_filetypes': ['php', 'js'],
                            \ 'passive_filetypes': [] }

" set javascript spellchecker
let g:syntastic_javascript_checkers = ['jshint']

" set php spellchecker
let g:syntastic_php_checkers = ['php']

" jump to line with error
let g:syntastic_auto_jump=1

" ==============================================================================
" ctrlp
" ==============================================================================

" search for git repo
let g:ctrlp_working_path_mode = 'r'

" open file in new tab
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

" ignore target directory
let g:ctrlp_custom_ignore = {
  \ 'file': '\v\.(exe|so|dll|png|jpg|jpeg|psd|gif)$',
  \ 'dir':  'target',
  \ }

" ==============================================================================
" git gutter
" ==============================================================================
let g:gitgutter_eager=0


" ==============================================================================
" Status bar
" ==============================================================================

" powerline
set timeout ttimeoutlen=50
let g:Powerline_symbols = 'fancy'
"let g:Powerline_colorscheme = 'solarized256'
"let g:Powerline_stl_path_style = 'full'

" always show status line
set laststatus=2

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

" ==============================================================================
" NERDTree Settings
" ==============================================================================
let NERDTreeShowHidden=1
let NERDTreeCaseSensitiveSort=1

" ==============================================================================
" Hotkeys
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
nmap <leader>n :lnext<CR>

" :leprevious - prev error
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

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

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
"
" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

"let g:snippets_dir = "~/.vim/snippets"
" ==============================================================================
" Useful shortcuts
" ==============================================================================
" J - merge lines
" ysiw" : Hello world => "Hello" world
" cs"' : "Hello" world => 'Hello' world
" ds' : 'Hello' world => Hello world
" vlllS' : Hello => 'Hell'o
