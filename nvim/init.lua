-- Add Luarocks paths for Lua modules (.lua) and C modules (.so)
local package_path_str = os.getenv("HOME") .. "/.luarocks/share/lua/5.1/?.lua;" ..
                         os.getenv("HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
local package_cpath_str = os.getenv("HOME") .. "/.luarocks/lib/lua/5.1/?.so;"

package.path = package.path .. ";" .. package_path_str
package.cpath = package.cpath .. ";" .. package_cpath_str

-- Disable vim.lsp default keymaps. Using Coc.nvim instead.
vim.keymap.del('n', 'grr', { silent = true })
vim.keymap.del('n', 'grn', { silent = true })
vim.keymap.del('n', 'gri', { silent = true })
vim.keymap.del('n', 'gra', { silent = true })
vim.keymap.del('n', 'grt', { silent = true })

require("config.options")
require("config.lazy")
