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

function Map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end

  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Disable python2 provider
vim.g.loaded_python_provider = 0

-- Disable perl provider
vim.g.loaded_perl_provider = 0

-- Disable ruby provider
vim.g.loaded_ruby_provider = 0


-- Opens vimrc file
--[[
   [Map('n', '<leader>ev', ':vsplit $MYVIMRC<CR>')
   [
   [-- Source vimrc file
   [Map('n', '<leader>es', ':source $MYVIMRC<CR>')
   ]]

