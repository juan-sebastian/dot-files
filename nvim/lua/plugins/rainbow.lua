return {
  {
    "luochen1990/rainbow",
    init = function()
      vim.g.rainbow_active = 1
      vim.g.rainbow_conf = {
        ['guifgs'] = {'royalblue3', 'darkorchid3', 'seagreen3', 'firebrick3'},
        ['operators'] = '',
        ['ctermfgs'] = {27, 127, 49, 160},
        ['parentheses'] = {[[start=/(/ end=/)/ fold]], [[start=/\[/ end=/\]/ fold]], [[start=/{/ end=/}/ fold]]}
      }
    end,
  },
}
