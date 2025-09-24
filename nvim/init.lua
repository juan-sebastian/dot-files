-- Disable vim.lsp default keymaps. Using Coc.nvim instead.
vim.keymap.del('n', 'grr', { silent = true })
vim.keymap.del('n', 'grn', { silent = true })
vim.keymap.del('n', 'gri', { silent = true })
vim.keymap.del('n', 'gra', { silent = true })
vim.keymap.del('n', 'grt', { silent = true })

require("config.options")
require("config.lazy")
