call pathogen#infect()
call pathogen#helptags()

set ls=2            " allways show status line
set hlsearch        " highlight searches
set incsearch       " do incremental searching
set ruler           " show the cursor position all the time
set number          " show line numbers
set numberwidth=4   " line numbering takes up 5 spaces
set ignorecase      " ignore case when searching
set nowrap          " stop lines from wrapping
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.DS_Store,*.db
set mouse=a

set backup
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

set autoindent
set smarttab
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

set background=dark
colorscheme solarized

syntax on
filetype on
filetype indent on
filetype plugin on

map <F1> :NERDTreeToggle<CR>
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
map <F12> :nohl<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1
let g:syntastica_auto_loc_list=1

set statusline+=%{fugitive#statusline()}
