" =========================================================================
" Standard Configuration Settings
" =========================================================================

syntax on
syntax enable
autocmd! bufwritepost .vimrc source % " automatic vimrc file reload

set ma
set cursorline
" set cursorcolumn
set clipboard+=unnamedplus
set t_Co=256 " 256 colors in the terminal
set noerrorbells
set tabstop=4 softtabstop=4 " number of spaces per tab
set shiftwidth=4
set expandtab " tabs are spaces
set smartindent
set nu " line numbers
set relativenumber " set relative line numbers
set nowrap
set smartcase " include only uppercase words with uppercase letter
set noswapfile
set nobackup " backup and swap turned off
set nowritebackup
set undodir=~/.vim/undodir
set undofile
set incsearch " search as characters are entered
set hlsearch " highlight matches
set ignorecase " search uppercase as lowercase
set smartcase " include only uppercase words with uppercase letter
" set guicursor
set backspace=indent,eol,start " fixes common backspace problems
set bs=2 " normal backspace use
set ttyfast " speed up scrolling
set hidden " work with buffers
set mouse=a " mouse on
set scrolloff=8 " display x lines above below when scrolling with a mouse
set cmdheight=1 " more space for displaying messages
set updatetime=300 " short update screen time (ms)
set lazyredraw
set showmatch " highlight matching brackets / noshowmatch
set termguicolors
set encoding=utf-8
set pastetoggle=<F2>
set showmode
set grepprg=rg\ --vimgrep
set shortmess+=c " dont pass messages to ins-completion-menu
" set signcolumn=yes " always show signcolumns
" set 7 lines from beginning and end of file
set so=7
set laststatus=2

set history=700 " history of undos
set undolevels=700 " undo levels

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" ============================================================================
" Plugin Management and config
" ===========================================================================

" automatic Plug installation for vim
if !has('vim')
    if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
endif

" automatic Plug installation for nvim
if has('nvim')
    if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
        silent !curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
endif

" List of plugins to install with Plug
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdcommenter'
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'ThePrimeagen/vim-be-good'
Plug 'luochen1990/rainbow'
Plug 'psliwka/vim-smoothie'
Plug 'Yggdroot/indentLine'
Plug 'mechatroner/rainbow_csv'
Plug 'antoinemadec/coc-fzf'

call plug#end()

" COC extensions
let g:coc_global_extensions = ['coc-cfn-lint', 'coc-python', 'coc-markdownlint', 'coc-lists', 'coc-git', 'coc-json', 'coc-yaml', 'coc-sql', 'coc-clangd', 'coc-cmake', 'coc-jedi', 'coc-sh', 'coc-xml', 'coc-explorer', 'coc-go', 'coc-yank']

" --- vim go (polyglot) settings.
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1

" disable polyglot for certain filetypes
let g:polyglot_disabled = ['csv']

colorscheme gruvbox
set background=dark
set noshowmode

filetype plugin indent on
" indent guides toggle on
let g:indent_guides_enable_on_vim_startup = 1

" set indentation
let g:indentLine_setColors = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" use root directory for searching instead of current
" if executable('rg')
"     let g:rg_derive_root='true'
" endif

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
let g:coc_fzf_preview = ''
let g:coc_fzf_opts = []

let loaded_matchparen = 1
let g:rainbow_active = 1

let g:netrw_browse_split = 2
let g:vrfr_rg = 'true'
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1

" ===========================================================================
" Key mappings
" ===========================================================================

" let mapleader = " "
map <Space> <leader>
" 0 goes to first non-blank character
map 0 ^
nmap <leader><CR> O<Esc>
nmap <CR> o<Esc>
" remap ESC key in insert mode only
:imap jj <esc>
" vim jumping remap
nnoremap <leader>[ <c-o>
nnoremap <leader>] <c-i>
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" faster vertical movement
" normal mode:
nnoremap <c-j> 5j
nnoremap <c-k> 5k
" visual mode:
xnoremap <c-j> 5j
xnoremap <c-k> 5k
" switch panes by leader + hjkl
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
" managing tabs
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>tm :tabmove<space>
" leader + number is now used to move through tabs
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 :tablast<cr>
" Undo tree shortcut
nnoremap <leader>u :UndotreeShow<CR>
" fzf shortcuts
" nnoremap <Leader>g :GFiles<CR>
nnoremap <Leader>s :Find<SPACE>
nnoremap <Leader>b :Buffer<CR>
nnoremap <Leader>dc :Commits<CR>
" nnoremap <Leader>f :RootFiles<CR>
nnoremap <Leader>rf :Files ~/<CR>
nnoremap <leader>f :ProjectFiles<CR>
" nnoremap <Leader>f :Files<CR>
nnoremap <leader>ws :Find <C-R>=expand("<cword>")<CR><CR>
" resize panes
nnoremap <Leader>= :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
" nerdtree configuration
nmap <leader>t :NERDTreeToggle<CR>
nmap <leader>tf :NERDTreeFind<CR>
" nerd commenter
nmap <leader>cc :NERDCommenterComment<CR>
nmap <leader>c<space> :NERDCommenterToggle<CR>
" select in visual mode and move whole block with J and K
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" remove highlight of the search
nnoremap <leader>/ :noh<CR>
" copy / paste to the system clipboard
" noremap <leader>y "+y
" noremap <leader>p "+p
" quicker delete inside parantheses
nnoremap ci( f(ci(
nnoremap di( f(di(
nnoremap ci) f)ci)
nnoremap ci) f)ci)
nnoremap ci" f"ci"
nnoremap ci' f'ci'
nnoremap ci{ f{ci{
nnoremap ci} f}ci}
nnoremap ci[ f[ci[
nnoremap ci] f]ci]
" coc explorer
nmap <leader>e :CocCommand explorer<CR>
" coc yank
" nnoremap <leader>y :<C-u>CocList -A --normal yank<cr>
nnoremap <leader>y :CocFzfList yank<cr>

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gt <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next)
nnoremap <leader>cr :CocRestart
" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Sweet Sweet FuGITive
nmap <leader>gh :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gs :G<CR>
nmap <leader>gv :Gvdiffsplit!<CR>
nmap <leader>gc :Gcommit<CR>

" ============================================================================
" Scripts and defined commands
" ============================================================================

" close vim if the only open window is NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Define your own Find command to use ripgrep inside of fzf
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --glob "!.tox/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

" Show documentation script for Coc
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Function to search for files from root project directory
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Script for trimming the whitespace
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Config for rainbow csv
autocmd BufWinEnter *.csv set buftype=nowrite | :%s/,/|/g
autocmd BufRead,BufNewFile *.csv set filetype=csv_pipe
