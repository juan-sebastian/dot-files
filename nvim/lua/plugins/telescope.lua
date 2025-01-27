return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
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
    },
    lazy = false,
  }
}
