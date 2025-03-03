return {
  { "folke/lazy.nvim", version = false },
  { "LazyVim/LazyVim", version = false },
{
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- For icons
    config = function()
      require("lualine").setup {
        options = {
          theme = "auto",             -- Automatically match your colorscheme
          icons_enabled = true,       -- Enable icons (requires Nerd Font)
          section_separators = "",    -- No separators by default
          component_separators = "",
        },
      }
    end,
  },
  {
    "nanotech/jellybeans.vim",
    config = function()
      vim.cmd("colorscheme jellybeans")
    end,
    lazy = false,
  },
  {
    "preservim/nerdcommenter",
    event = "BufReadPost",
  },
  {
    "sjl/gundo.vim",
    config = function()
      vim.g.gundo_prefer_python3 = 1
    end,
    keys = {"<leader>u", mode = {"n"}, ":GundoToggle<CR>"},
  },
  { "godlygeek/tabular" },
  { "othree/html5.vim" },
  { "tpope/vim-fugitive" },
  { "fatih/vim-go" },
  { "tpope/tpope-vim-abolish" },
  {
    "qpkorr/vim-bufkill",
    init = function()
      vim.g.BufKillCreateMappings = 0
    end,
  },
  { "MattesGroeger/vim-bookmarks" },
    { "pangloss/vim-javascript" },
  { "mxw/vim-jsx" },
  { "HerringtonDarkholme/yats.vim" },
  { "sQVe/sort.nvim" },
  { "rhysd/vim-clang-format" },
  -- TODO: add config installation funciton
  {
    "junegunn/fzf"
  },
  {
    "eraserhd/parinfer-rust",
    build = "cargo build --release"
  },
  { "tpope/vim-rhubarb" },
  {
    "mg979/vim-visual-multi",
    branch = "master"
  },
  { "tpope/vim-obsession" },
  { "bakpakin/fennel.vim" },
  {
    "github/copilot.vim",
    config = function()
      vim.g.copilot_filetypes = {
        ["gitcommit"] = true,
      }
    end,
  },
  { "MunifTanjim/nui.nvim" },
  {
    "piersolenski/wtf.nvim",
    config = function()
      require("wtf").setup()
    end
  },
  {
    "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup()
    end
  },
  { "stevearc/dressing.nvim" },
  {
    "akinsho/flutter-tools.nvim",
    config = function()
      require("flutter-tools").setup {}
    end
  },
  {
    "nvim-tree/nvim-web-devicons"
  },
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end
  },
}
