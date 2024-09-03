return {
  {
    "guns/vim-sexp",
    config = function()
      vim.g.sexp_filetypes = ""
    end,
    ft = "clojure"
  },
  {
    "liquidz/vim-iced",
    init = function()
      vim.g.iced_enable_default_key_mappings = 1
    end,
    ft = "clojure"
  },
  {
    dependencies = { "neoclide/coc.nvim", "liquidz/vim-iced" },
    "liquidz/vim-iced-coc-source",
    ft = "clojure"
  },
}
