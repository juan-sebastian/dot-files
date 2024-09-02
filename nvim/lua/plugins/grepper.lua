return {
  {
    "mhinz/vim-grepper",
    keys = {
      {"<leader>a", mode = {"n"}, ":Grepper -tool ag<CR>"},
      {"<leader>A", mode = {"n"}, ":Grepper -tool ag -switch -cword -noprompt<CR>"},
      {"<leader>lg", mode = {"n"}, ":Grepper-buffers -tool ag<CR>"},
      {"<leader>lG", mode = {"n"}, ":Grepper-buffers -tool ag -switch -cword -noprompt<CR>"},
    },
  },
}
