return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'andrew-george/telescope-themes',
      'nvim-telescope/telescope-fzf-native.nvim',
    },
    config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')

      telescope.setup({
        defaults = {
          file_ignore_patterns = {
            ".git/",
            "node_modules/",
            "target/",
            "dist/",
            "build/"
          },
          mappings = {
            i = {
              ["<esc>"] = actions.close,
              ["<C-u>"] = false
            },
          }
        },
        pickers = {
          find_files = {
            hidden = true
          }
        }
      })
    end,
    keys = {
      {"<Leader>b", "<cmd>Telescope buffers<cr>", mode = "n", desc = "Find buffers"},
      {"<Leader>j", "<cmd>Telescope lsp_document_symbols<cr>", mode = "n", desc = "Find symbols in file"},
      {"<leader>t", "<cmd>Telescope find_files<cr>", mode = "n", desc = "Find files"},
      {"<leader>fg", "<cmd>Telescope live_grep<cr>", mode = "n", desc = "Live grep"},
      {"<leader>fh", "<cmd>Telescope help_tags<cr>", mode = "n", desc = "Help tags"},
      {"<leader>ft", "<cmd>Telescope themes<cr>", mode = "n", desc = "Help tags"},
    },
    lazy = false,
  },

  -- ColorScheme
  { 'folke/tokyonight.nvim' },
  { 'catppuccin/nvim', name = 'catppuccin' },
  { 'rose-pine/neovim', name = 'rose-pine' },
  { 'rebelot/kanagawa.nvim' },
  { 'EdenEast/nightfox.nvim' },
  { 'morhetz/gruvbox' },
  { 'dracula/vim', name = 'dracula' },
  { 'arcticicestudio/nord-vim' },
  { 'sainnhe/everforest' },
  { 'sainnhe/gruvbox-material' },
  { 'navarasu/onedark.nvim' },
  { 'marko-cerovac/material.nvim' },
  { 'nanotech/jellybeans.vim' },
}
