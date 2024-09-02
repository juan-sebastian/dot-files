function CommandTSelector()
  local command = vim.fn.system('bb ' .. vim.fn.stdpath('config') .. '/babashka/command-t-selector.clj')
  vim.cmd(command)
end

return {
  {
    "wincent/command-t",
    build = "cd lua/wincent/commandt/lib && make",
    init = function()
      vim.g.CommandTPreferredImplementation = "lua"
    end,
    config = function()
      require("wincent.commandt").setup()
      vim.g.CommandTWildIgnore = vim.o.wildignore
        .. ",*/.git/*"
        .. ",*/node_modules/*"
        .. ",*/target/*"
        .. ",*/dist/*"
        .. ",*/build/*"
    end,
    keys = {
      {"<Leader>b", mode = {"n"}, "<Plug>(CommandTBuffer)"},
      {"<Leader>j", mode = {"n"}, "<Plug>(CommandTJump)"},
      {"<leader>t", mode = {"n"}, ":lua CommandTSelector()<CR>"},
    },
  },
}
