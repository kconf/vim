let mapleader = "\<Space>"

" self-install minipac!
if empty(glob('~/.vim/pack/minpac/opt/minpac'))
  let s:minpac_first_install = 1
  silent !git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
endif

" regular minpac setup
packadd minpac
call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})

" fzf
call minpac#add('junegunn/fzf.vim')

call minpac#add('tpope/vim-surround')

" programming
call minpac#add('tomtom/tcomment_vim')
call minpac#add('sheerun/vim-polyglot')
call minpac#add('tpope/vim-dispatch', {'type': 'opt'})

" color scheme
call minpac#add('morhetz/gruvbox')

" actually install plugins
if exists('s:minpac_first_install')
  call minpac#update()
endif

command! PackUpdate call minpac#update()
command! PackClean  call minpac#clean()
command! PackStatus call minpac#status()

" fzf
if has('macunix')
  set rtp+=/usr/local/opt/fzf
endif
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>g :GFiles<CR>
nnoremap <Leader>s :Rg<CR>
nnoremap <Leader>b :Buffers<CR>

" color scheme
set termguicolors
set background=dark
colorscheme gruvbox

" built-in plugins
runtime! macros/matchit.vim

"" moving around, searching and patterns
set incsearch "	show match for partly typed search command
set ignorecase " ignore case when using a search pattern
set smartcase " override 'ignorecase' when pattern has upper case characters

"" tags
"" displaying text
set scrolloff=3	" number of screen lines to show around the cursor
set linebreak " wrap long lines at a character in 'breakat'
set showbreak=↪\ \  " string to put before wrapped screen lines
set sidescroll=2 " minimal number of columns to scroll horizontally

" Define characters to show when you show formatting
" stolen from https://github.com/tpope/vim-sensible
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u26ad"
  endif
endif

set number " show the line number for each line
set relativenumber " show the relative line number for each line

set cursorline " highlight the screen line of the cursor

"" multiple windows
set laststatus=2 " always use a status line for the last window
set helpheight=30 " initial height of the help window

"" messages and info
set showcmd " show (partial) command keys in the status line
set ruler " show cursor position below each window
set confirm " start a dialog when a command fails

"" selecting text
set clipboard=unnamed " Yank to the system clipboard by default

"" editing text
set backspace=indent,eol,start " backspace over everything
set formatoptions+=j " delete comment char on second line when joining two commented lines
set showmatch " when inserting a bracket, briefly jump to its match
set nojoinspaces " Use only one space after '.' when joining lines, instead of two

"" tabs and indenting
set tabstop=4 " number of spaces a <Tab> in the text stands for
set shiftwidth=4 " number of spaces used for each step of (auto)indent
set smarttab " a <Tab> in an indent inserts 'shiftwidth' spaces
set softtabstop=4 " if non-zero, number of spaces to insert for a <Tab>
set expandtab " expand <Tab> to spaces in Insert mode

"" folding
set nofoldenable " When opening files, all folds open by default

"" reading and writing files
set autoread " automatically read a file when it was modified outside of Vim (global or local to buffer)

"" command line editing
set history=200 " how many command lines are remembered
set wildmode=list:longest,full " Command <Tab> completion, list matches, then longest common part, then all.
set wildmenu " command-line completion shows a list of matches

"" multi-byte characters
set encoding=utf-8 " character encoding used in Vim
set fileencodings=utf-8,cp936,big5,utf-16le,latin1 " automatically detected character encodings
