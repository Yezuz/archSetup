set nocompatible
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
Plug 'Badacadabra/vim-archery'
Plug 'rakr/vim-one'
Plug 'arzg/vim-colors-xcode'
Plug 'flazz/vim-colorschemes'
" Plug 'joshdick/onedark.vim'

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
Plug 'nickspoons/vim-sharpenup'
Plug 'tpope/vim-dadbod'
" Plug 'tpope/vim-vinegar'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'vim-scripts/dbext.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'dense-analysis/ale'
" Plug  'OrangeT/vim-csharp'
" Plug 'ervandew/supertab'
Plug 'tpope/vim-fugitive'
" Waiting for stable v0.5 of neovim, currently in development
" Plug 'neovim/nvim-lspconfig'
" Plug 'anott03/nvim-lspinstall'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


call plug#end()

set termguicolors
"colorscheme monokai
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_bold = 1
let g:gruvbox_italic = 1
let g:gruvbox_italicize_comments = 1
let g:gruvbox_italicize_strings=1
let g:gruvbox_transparent_bg = 1
let g:materialbox_transparent_bg = 1
let g:materialbox_italic = 1
let g:materialbox_bold = 1
let g:materialbox_contrast_dark = "medium"
let g:materialbox_italicize_strings = 1
let g:materialbox_italicize_comments = 1

" let g:onedark_hide_endofbuffer = 1
" let g:onedark_terminal_italics = 1

let g:one_allow_italics = 1
let g:one_bold = 1

" colorscheme gruvbox
" colorscheme materialbox
colorscheme one
" colorscheme monokai_pro
set background=dark 
" colorscheme hybrid_reverse

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
let g:airline_theme="one"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter= 'unique_tail'
" let g:airline_left_sep='>'
let g:airline_powerline_fonts = 1
" let g:airline#extensions#ale#enabled = 1
" let airline#extensions#ale#error_symbol = 'e:'
" let airline#extensions#ale#warning_symbol = 'w:'
" let g:airline#extensions#branch#enabled = 1 

" set guifont=CodeNewRoman\ NF:h8
set guifont=SauceCodePro\ NF:h10
"set guifont=Monaco:h13

" Custom keymaps
nmap <leader>b :buffers<CR>:buffer<Space>
nnoremap <C-e> :NERDTreeToggle<CR>
nmap <leader>e :NERDTreeToggle<CR>

let g:neovide_refresh_rate=140
let g:neovide_transparency=0.95
"let g:neovide_multi_grid=v:true
let g:neovide_cursor_antialiasing=v:true
let g:neovide_cursor_vfx_mode="wireframe"

" leader + l keys redraws the screen and removes any search highlighting
nmap <leader>l :nohl<CR>
nmap <leader>w <C-w>

" OmniSharp settings 
" let g:OmniSharp_server_stdio = 1
" let g:omnicomplete_fetch_full_documentation = 1
" let g:OmniSharp_timeout = 30


"  FVim Specific

 " FVimCursorSmoothMove v:true
 " FVimCursorSmoothBlink v:true
 " FVimUIPopupMenu v:true
 " FVimBackgroundOpacity 0.90
 " FVimBackgroundComposition 'transparent'
 " FVimFontAntialias v:true
 " FVimFontAutohint v:true
 " FVimFontHintLevel 'full'
 " FVimFontLigature v:true
 " FVimFontLineHeight '+1.0'
 " FVimFontSubpixel v:true
 " FVimFontNoBuiltinSymbols v:true
 " FVimFontAutoSnap v:true
"
" ALE Setup
" let g:ale_completion_enabled = 1
let g:ale_set_ballons = 1 
let g:ale_detail_to_floating_preview = 1 
let g:ale_hover_to_preview = 1
let g:ale_popup_menu_enabled = 1
let g:ale_floating_preview = 1
let g:ale_sign_error = 'xx'
let g:ale_sign_warning = '!!'
let g:ale_completion_symbols = {
  \ 'text': '',
  \ 'method': '',
  \ 'function': '',
  \ 'constructor': '',
  \ 'field': '',
  \ 'variable': '',
  \ 'class': '',
  \ 'interface': '',
  \ 'module': '',
  \ 'property': '',
  \ 'unit': 'unit',
  \ 'value': 'val',
  \ 'enum': '',
  \ 'keyword': 'keyword',
  \ 'snippet': '',
  \ 'color': 'color',
  \ 'file': '',
  \ 'reference': 'ref',
  \ 'folder': '',
  \ 'enum member': '',
  \ 'constant': '',
  \ 'struct': '',
  \ 'event': 'event',
  \ 'operator': '',
  \ 'type_parameter': 'type param',
  \ '<default>': 'v'
  \ }



" Useful keymaps
nmap <leader>gh :ALEHover<CR>
" nmap <F12> :ALEGoToDefinition<CR>
" nmap <F2> :ALERename<CR>

" CoC setup
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

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
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
 nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" workaround for coc-goto-definition
autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>

nmap <leader>. :CocFix<CR>

let g:coc_global_extensions=['coc-omnisharp', 'coc-json', 'coc-sql', 'coc-eslint', 'coc-html', 'coc-db']

let g:OmniSharp_server_stdio = 1
let g:omnicomplete_fetch_full_documentation = 1
let g:OmniSharp_timeout = 30
let g:OmniSharp_autoselect_existing_sln = 1

let g:OmniSharp_popup_options = {
      \ 'highlight': 'Normal',
      \ 'padding': [1],
      \ 'border': [1]
      \}

let g:sharpenup_map_prefix = '.'

nmap <C-F> <Plug>CtrlSFPrompt

let g:fzf_preview_window = ['right:50%', 'ctrl-/']
