return {
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<C-l>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-h>",
          },
        },
        panel = { enabled = false },
        filetypes = {
          gitcommit = true,
        },
      })
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    build = "make tiktoken",
    config = function()
      require("CopilotChat").setup()
    end,
  },
}
