" to include pathogen plugin
call pathogen#infect()
call pathogen#helptags()

" get that filetype stuff happening
filetype on
filetype plugin on
filetype indent on

" turn on that syntax highlighting
syntax on

" why is this not a default
set hidden

" disable vi-compatability
set nocompatible

" always show the statusline
set laststatus=2

" necessary to show unicode glyphs
set encoding=utf-8

" Explicitly tell Vim that the terminal supports 256 colors
set t_Co=256

" turn on line number by default
set number

" set textwidth
set textwidth=80

" display the mode
set showmode

" use tab as 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" set colorscheme for gvim
colorscheme murphy

" code folding settings
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" set gui widgets option for gvim
set guioptions-=T   " remove toolbar
set guioptions+=m   " include menubar

" set local current directory to the file directory
autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif

" auto remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" set spell checker and word completion on
setlocal spell spelllang=en_gb
set complete+=kspell

" use TAB to complete when typing words, else inserts TABs as usual.
" uses dictionary and source files to find matching words to complete.

" see help completion for source,
""Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
""Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
function! Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
    endif
endfunction
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

" set window size for gvim
if has("gui_running")
    set lines=60 columns=110
endif

" change `plaintex` filetype to `tex`
let g:tex_flavor='latex'

" force `*.md` as `markdown`
autocmd BufNewFile,BufRead *.markdown,*.md,*.mdown,*.mkd,*.mkdn set ft=markdown
