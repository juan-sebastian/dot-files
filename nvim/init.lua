local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.local/share/nvim/plugged')

Plug('junegunn/vim-plug')
Plug('vim-airline/vim-airline')
Plug('vim-airline/vim-airline-themes')
Plug('nanotech/jellybeans.vim')
Plug('w0rp/ale')
Plug('scrooloose/nerdcommenter')
Plug('sjl/gundo.vim')
Plug('godlygeek/tabular')
Plug('easymotion/vim-easymotion')
Plug('haya14busa/incsearch.vim')
Plug('haya14busa/incsearch-easymotion.vim')
Plug('othree/html5.vim')
Plug('wincent/command-t', {['do'] = 'cd lua/wincent/commandt/lib && make'})
Plug('mhinz/vim-grepper')
Plug('tpope/vim-fugitive')
Plug('fatih/vim-go')
Plug('tpope/tpope-vim-abolish')
Plug('qpkorr/vim-bufkill')
Plug('Shougo/unite.vim')
Plug('Shougo/vimfiler.vim')
Plug('ryanoasis/vim-devicons')
Plug('neoclide/coc.nvim', {['branch'] = 'release'})
Plug('MattesGroeger/vim-bookmarks')
Plug('pangloss/vim-javascript')
Plug('mxw/vim-jsx')
Plug('HerringtonDarkholme/yats.vim')
Plug('luochen1990/rainbow')
Plug('sQVe/sort.nvim')
Plug('rhysd/vim-clang-format')
--TODO: Check why it is asking for credentials
--Plug('guns/xrm-color-table.vim')
-- Depency for v-icd
Plug('guns/vim-sexp',   {['for'] = 'clojure'})
Plug('junegunn/fzf', {['do'] = vim.fn['fzf#install']})
Plug('liquidz/vim-iced', {['for'] = 'clojure'})
Plug('liquidz/vim-iced-coc-source', {['for'] = 'clojure'})
Plug('guns/vim-clojure-static')
Plug('guns/vim-clojure-highlight')
Plug('eraserhd/parinfer-rust', {['do'] = 'cargo build --release'})
Plug('tpope/vim-rhubarb')
Plug('mg979/vim-visual-multi', {['branch'] = 'master'})
Plug('tpope/vim-obsession')
Plug('bakpakin/fennel.vim')
Plug('hashivim/vim-terraform')
Plug('github/copilot.vim')

Plug('MunifTanjim/nui.nvim')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim')
Plug('jackMort/ChatGPT.nvim')

vim.call('plug#end')

require("chatgpt").setup()

-- TODO: Remove default ones
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 300
vim.opt.swapfile = false
vim.opt.number = true
vim.opt.laststatus = 2
vim.opt.backspace = 'indent,eol,start'
vim.opt.clipboard:append {'unnamedplus'}
vim.opt.encoding = 'UTF-8'
vim.opt.shell = '/opt/homebrew/bin/zsh'

vim.api.nvim_command('syntax on')


-- Leader key mapping
vim.g.mapleader = ','


-- map function
function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end

	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


-- Airline config
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g.airline_powerline_fonts = 1


-- Ale options
vim.g.ale_linters = {
	['python'] = {'flake8'},
	['javascript'] = {'eslint'},
	['typescript'] = {'eslint'},
	['go'] = {'gopls'},
	['yaml'] = {'yamllint'},
	['cpp'] = {'clang', 'clangtidy'},
	['sh'] = {'language_server'},
	['clojure'] = {'clj-kondo'},
	['proto'] = {'protoc-gen-lint'},
	['dockerfile'] = {'hadolint'},
	['java'] = {'checkstyle'}
}
vim.g.ale_echo_msg_format = '[%linter%] %code: %%s'
vim.g.ale_cpp_clang_options = '-std=c++17 -Wall'
vim.g.ale_proto_protoc_gen_lint_options = '-I /usr/local/include'


-- Undo tree options
vim.g.gundo_prefer_python3 = 1
map('n', '<leader>u', ':GundoToggle<CR>')


-- Spell checking English
function SpellCheckToggle()
	if vim.b.spell_check_is_on then
		vim.opt.spell = false
	else
		vim.opt.spell = true
	end

	vim.b.spell_check_is_on = not vim.b.spell_check_is_on
end
map('n', '<leader>s', ':lua SpellCheckToggle()<CR>')


-- Incsearch mapping
vim.opt.hlsearch = true
vim.g['incsearch#auto_nohlsearch'] = 1

map('', '/', '<Plug>(incsearch-easymotion-/)')
map('', '?', '<Plug>(incsearch-easymotion-?)')
map('', 'g/', '<Plug>(incsearch-easymotion-stay)')
map('', 'n', '<Plug>(incsearch-nohl-n)')
map('', 'N', '<Plug>(incsearch-nohl-N)')
map('', '*', '<Plug>(incsearch-nohl-*)')
map('', '#', '<Plug>(incsearch-nohl-#)')
map('', 'g*', '<Plug>(incsearch-nohl-g*)')
map('', 'g#', '<Plug>(incsearch-nohl-g#)')


-- Command-t filter some file types
vim.g.CommandTPreferredImplementation = 'lua'
require('wincent.commandt').setup()
map('n', '<Leader>b', '<Plug>(CommandTBuffer)')
map('n', '<Leader>j', '<Plug>(CommandTJump)')
map('n', '<Leader>t', '<Plug>(CommandT)')


-- vim-grepper Config
map('n', '<leader>a', ':Grepper -tool ag<CR>')
map('n', '<leader>A', ':Grepper -tool ag -switch -cword -noprompt<CR>')
map('n', '<leader>lg', ':Grepper-buffers -tool ag<CR>')
map('n', '<leader>lG', ':Grepper-buffers -tool ag -switch -cword -noprompt<CR>')

-- VimFiler
vim.g.vimfiler_as_default_explorer = 1
vim.g.vimfiler_define_wrapper_commands = 1
vim.g.vimfiler_tree_leaf_icon = '¦'
vim.g.vimfiler_tree_opened_icon = '▼'
vim.g.vimfiler_tree_closed_icon = '▷'
vim.g.vimfiler_file_icon = '-'
vim.g.vimfiler_readonly_file_icon = '*'
vim.g.vimfiler_marked_file_icon = '√'

vim.call('vimfiler#custom#profile',
	'default',
	'context',
	{['safe'] = 0,
	 ['explorer'] = 1,
	 ['toggle'] = 1,
	 ['columns'] = 'type',
	 ['status'] = 1})

map('n', '<leader>f', ':VimFilerExplore<CR>')
map('n', '<leader>ff', ':VimFilerExplore -find<CR>')
map('n', '<leader>^', ':edit %:h<CR>')


-- Rainbow
vim.g.rainbow_active = 1
vim.g.rainbow_conf = {
	['guifgs'] = {'royalblue3', 'darkorchid3', 'seagreen3', 'firebrick3'},
	['operators'] = '',
	['ctermfgs'] = {27, 127, 49, 160},
	['parentheses'] = {[[start=/(/ end=/)/ fold]], [[start=/\[/ end=/\]/ fold]], [[start=/{/ end=/}/ fold]]}}

-- Vim-Bookmark
vim.call('unite#custom#profile',
	'source/vim_bookmarks',
	'context',
	{['winheight'] = 13,
	 ['direction'] = 'botright',
	 ['start_insert'] = 0})

-- vim-bufkill Config
vim.g.BufKillCreateMappings = 0


-- Disable python2 provider
vim.g.loaded_python_provider = 0


-- Disable vim-sexp (only needs the functions for vim-iced)
vim.g.sexp_filetypes = ''

-- Opens vimrc file
map('n', '<leader>ev', ':vsplit $MYVIMRC<CR>')

-- Source vimrc file
map('n', '<leader>es', ':source $MYVIMRC<CR>')

-- Copilot config
vim.g.copilot_filetypes = {
  ['gitcommit'] = true,
}

-- Coc config
require('vim_config.coc')

vim.cmd('color jellybeans')
