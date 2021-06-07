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

let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide=',\(^\|\s\s\)\zs\.\S\+'

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
set timeoutlen=1000
set splitright
set splitbelow
set cmdheight=2
let mapleader= " "
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
" Plug 'christoomey/vim-tmux-navigator'
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
Plug 'tpope/vim-fugitive'
" Waiting for stable v0.5 of neovim, currently is in development
" Plug 'neovim/nvim-lspconfig'
" Plug 'anott03/nvim-lspinstall'
call plug#end()

set termguicolors
colorscheme gruvbox
"colorscheme monokai
let g:gruvbox_contrast_dark = "hard"
" let g:gruvbox_bold = 1
" let g:gruvbox_italic = 1
" let g:gruvbox_italicize_comments = 1
" let g:gruvbox_italicize_strings=1
"colorscheme monokai_pro
" set background=dark 
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

" airline setup
let g:airline_theme="hybrid"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter= 'unique_tail'
" let g:airline#extensions#branch#enabled = 1 

set guifont=CodeNewRoman\ NF:h12
"set guifont=Monaco:h13

" Custom keymaps
nmap <leader>b :buffers<CR>:buffer<Space>
nnoremap <C-e> :NERDTreeToggle<CR>
nmap <leader>e :NERDTreeToggle<CR>

"let g:neovide_refresh_rate=140
let g:neovide_transparency=0.95
"let g:neovide_multi_grid=v:true
let g:neovide_cursor_antialiasing=v:true
let g:neovide_cursor_vfx_mode="wireframe"

" leader + l keys redraws the screen and removes any search highlighting
nmap <leader>l :nohl<CR>
nmap <leader>w <C-w>

" OmniSharp settings start
" let g:OmniSharp_server_stdio = 1
" let g:omnicomplete_fetch_full_documentation = 1
" let g:OmniSharp_timeout = 30
"
" FVim Specific
FVimCursorSmoothMove v:true
FVimCursorSmoothBlink v:true
FVimUIPopupMenu v:true
FVimBackgroundOpacity 0.90
" FVimBackgroundAltOpacity 0.70
FVimBackgroundComposition 'transparent'
FVimFontAntialias v:true
FVimFontAutohint v:true
FVimFontHintLevel 'full'
FVimFontLigature v:true
FVimFontLineHeight '+1.0'
" FVimFontNoBuiltInSymbols v:true
FVimFontSubpixel v:true
FVimFontAutoSnap v:true
