return {
  {
    "luukvbaal/nnn.nvim",
    config = function()
      require("nnn").setup()
    end,
    keys = {
      {"<leader>^", mode = {"n"}, ":NnnPicker %:h<CR>"},
    },
  },
}
