" makes vim ignore vi compatibility
set nocompatible
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**
set wildmenu
set cursorline
set foldenable
set foldmethod=indent
set spell
" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .
" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack
" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags
" FILE BROWSING
" Tweaks for browsing
let g:netrw_banner=0 "disable annoying banner
let g:netrw_browse_split=4 "open prior window
let g:netrw_altv=1 "open splits to the right
let g:netrw_liststyle=3 "tree view
let g:netrw_winsize=80
"let g:NERDCreateDefaultMappings = 1
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide=',\(^\|\s\s\)\zs\.\S\+'
" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings
set showtabline=2
set noshowmode
set smartindent
set number
set mouse=a
set numberwidth=1
set clipboard=unnamedplus
syntax enable
filetype plugin on
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2
set nobackup
set nowritebackup
set updatetime=300
set timeoutlen=100
set splitright
set splitbelow
set cmdheight=2
let mapleader=" "
set wildchar=<Tab> wildmenu wildmode=full

call plug#begin('~/.vim/plugged')

" Themes 
Plug 'morhetz/gruvbox'
Plug 'phanviet/vim-monokai-pro'
Plug 'nanotech/jellybeans.vim'
Plug 'dracula/vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'altercation/vim-colors-solarized'
Plug 'sickill/vim-monokai'

" ide
Plug 'christoomey/vim-tmux-navigator'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'PhilRunninger/nerdtree-buffer-ops'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'alvan/vim-closetag'
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'statico/vim-javascript-sql'
Plug 'elzr/vim-json'
Plug 'adamclerk/vim-razor'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'OmniSharp/omnisharp-vim'
Plug 'dense-analysis/ale'
Plug  'OrangeT/vim-csharp'
Plug 'ervandew/supertab'
call plug#end()

set termguicolors
colorscheme gruvbox
"colorscheme monokai
let g:gruvbox_contrast_dark = "hard"
"colorscheme monokai_pro
"set background=dark 
"colorscheme hybrid_material

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

let g:airline_theme="hybrid"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tablineformatter= 'unique_tail'

set guifont=CodeNewRoman\ NF:h12.5
"set guifont=Monaco:h13

" Custom keymaps
nmap <F5> :buffers<CR>:buffer<Space>
nnoremap <C-e> :NERDTreeToggle<CR>

"let g:neovide_refresh_rate=140
let g:neovide_transparency=0.95
"let g:neovide_multi_grid=v:true
let g:neovide_cursor_antialiasing=v:true
let g:neovide_cursor_vfx_mode="wireframe"

