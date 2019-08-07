set nocompatible              " required
filetype off                  " required

call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/vim-plug'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nanotech/jellybeans.vim'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdcommenter'
Plug 'sjl/gundo.vim'
Plug 'godlygeek/tabular'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'othree/html5.vim'
Plug 'wincent/command-t',  {
    \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
    \ }
Plug 'mileszs/ack.vim'
Plug 'sjbach/lusty'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'tpope/tpope-vim-abolish'
Plug 'qpkorr/vim-bufkill'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'MattesGroeger/vim-bookmarks'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'luochen1990/rainbow'
Plug 'rhysd/vim-clang-format'
Plug 'guns/xterm-color-table.vim'
Plug 'tpope/vim-fireplace'
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-clojure-highlight'
Plug 'snoe/clj-refactor.nvim'
Plug 'markwoodhall/vim-figwheel'
Plug 'vim-scripts/paredit.vim'
Plug 'venantius/vim-cljfmt'
Plug 'clojure-vim/async-clj-omni'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rhubarb'

call plug#end()
filetype plugin on

set nobackup
set noswapfile
set nu
set laststatus=2
set backspace=2
set t_Co=256
set clipboard=unnamedplus
set encoding=UTF-8
syntax on

set shell=/usr/local/bin/zsh

" Airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1


let mapleader=","

" Ale options
let g:ale_linters = {
\	'python': ['flake8'],
\	'javascript': ['eslint'],
\	'go': ['gopls'],
\	'yaml': ['yamllint'],
\	'cpp': ['clang', 'clangtidy']
\}

let g:ale_echo_msg_format='[%linter%] %code: %%s'
let g:ale_cpp_clang_options='-std=c++17 -Wall'
"let g:ale_cpp_clangtidy_executable='/usr/local/opt/llvm/bin/clang-tidy'
let g:ale_go_golangci_lint_options=''

" Comment Toggle Uses NERDCommenter
nmap \\ <leader>c<space>
xmap \\ <leader>c<space>

" Undo three
let g:gundo_prefer_python3 = 1
nmap <leader>u :GundoToggle<CR>

" Spell checking english
function SpellCheckToggle()
	if !exists("b:spell_check_is_on")
		let b:spell_check_is_on = 0
	endif
	if b:spell_check_is_on
		set nospell
		let b:spell_check_is_on = 0
	else
		setlocal spell spelllang=en_us
		let b:spell_check_is_on = 1
	endif
endfunction
nmap <leader>s :call SpellCheckToggle()<CR>

"Incsearch mapping
map / <Plug>(incsearch-easymotion-/)
map ? <Plug>(incsearch-easymotion-?)
map g/ <Plug>(incsearch-easymotion-stay)

set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

"Command-t filter some file types
let g:CommandTWildIgnore=&wildignore . ",*.pyc,*.a,*.snap,*/vendor,*/dist"
let g:CommandTMaxFiles=500000
let g:CommandTFileScanner='git'

"Ack use ag if installed
if executable('ag')
  let g:ackprg = 'ag --vimgrep --path-to-ignore ~/.ignore'
endif

"Ack Plugin shortcut
nmap <leader>a :Ack ""<Left>

"Ack on current cursor word
nmap <leader>A :Ack <C-r><C-w><CR>

"Lusty hide errors
set hidden

"Lusty load in memory before LustyBufferGrep
nmap <leader>lg :bufdo edit<CR>:LustyBufferGrep<CR>

"VimFiler
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_define_wrapper_commands = 1
let g:vimfiler_tree_leaf_icon = '¦'
let g:vimfiler_tree_opened_icon = '▼'
let g:vimfiler_tree_closed_icon = '▷'
let g:vimfiler_file_icon = '-'
let g:vimfiler_readonly_file_icon = '*'
let g:vimfiler_marked_file_icon = '√'
call vimfiler#custom#profile('default', 'context', {
      \ 'safe' : 0,
      \ 'explorer' : 1,
      \ 'toggle' : 1,
      \ 'columns' : 'type',
      \ 'status' : 1,
      \ })

nmap <leader>f :VimFilerExplore<CR>
nmap <leader>ff :VimFilerExplore -find<CR>
nmap <leader>^ :edit %:h<CR>

"Rainbow

let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['royalblue3', 'darkorchid3', 'seagreen3', 'firebrick3'],
\	'operators': '',
\	'ctermfgs': [27, 127, 49, 160],
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\}

"Vim-Bookmark
call unite#custom#profile('source/vim_bookmarks', 'context', {
	\   'winheight': 13,
	\   'direction': 'botright',
	\   'start_insert': 0,
	\ })

"clang-format
let g:clang_format#filetype_style_options = {
            \   'cpp' : {"Standard" : "C++11"},
            \ }

autocmd FileType c,cpp,h ClangFormatAutoEnable

"vim-go config
let g:go_def_mapping_enabled = 0

"Coc config

" Some servers have issues with backup files, see #649
set nowritebackup

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)


" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }



" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


color jellybeans
