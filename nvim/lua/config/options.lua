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

-- Disable python2 provider
vim.g.loaded_python_provider = 0

-- Disable perl provider
vim.g.loaded_perl_provider = 0

-- Disable ruby provider
vim.g.loaded_ruby_provider = 0


-- Opens vimrc file
vim.keymap.set('n', '<leader>ev', ':vsplit $MYVIMRC<CR>')

local options_file_path = vim.fn.fnamemodify(vim.fn.expand('$MYVIMRC'), ':h') .. '/lua/config/options.lua'
vim.keymap.set('n', '<leader>eo', ':vsplit ' .. options_file_path .. '<CR>')

-- Source vimrc file
vim.keymap.set('n', '<leader>es', ':source $MYVIMRC<CR>')

--- Run lua code key mapping
vim.keymap.set('n', '<leader>el', ':luafile %<CR>')
vim.keymap.set('n', '<leader>ee', ':.lua<CR>')
vim.keymap.set('v', '<leader>ee', ':lua<CR>')

