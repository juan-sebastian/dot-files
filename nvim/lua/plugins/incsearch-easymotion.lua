return {
  { "easymotion/vim-easymotion" },
  {
    "haya14busa/incsearch.vim",
    config = function()
      vim.opt.hlsearch = true
      vim.g["incsearch#auto_nohlsearch"] = 1
    end,
  },
  {
    "haya14busa/incsearch-easymotion.vim",
    keys = {
      { "/", mode = {"n"}, "<Plug>(incsearch-easymotion-/)" },
      { "?", mode = {"n"}, "<Plug>(incsearch-easymotion-?)" },
      { "g/", mode = {"n"}, "<Plug>(incsearch-easymotion-stay)" },
      { "n", mode = {"n"}, "<Plug>(incsearch-nohl-n)" },
      { "N", mode = {"n"}, "<Plug>(incsearch-nohl-N)" },
      { "*", mode = {"n"}, "<Plug>(incsearch-nohl-*)" },
      { "#", mode = {"n"}, "<Plug>(incsearch-nohl-#)" },
      { "g*", mode = {"n"}, "<Plug>(incsearch-nohl-g*)" },
      { "g#", mode = {"n"}, "<Plug>(incsearch-nohl-g#)" },
    },
  },
}
