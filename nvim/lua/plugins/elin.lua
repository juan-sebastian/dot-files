return {
  {
    "liquidz/elin-coc-source",
    config = function() end,
    ft = "clojure",
  },
  {
    "liquidz/vim-elin",
    ft = { "clojure", "clojurescript", "fennel" },
    config = function()
      -- Disable default mappings
      vim.g.elin_enable_default_key_mappings = 1

      -- Create custom mappings with modifications
      local opts = { noremap = true, silent = true }

      -- Connection (3 prefix)
      vim.keymap.set("n", "<Leader>3'", "<Plug>(elin_connect)", opts)
      vim.keymap.set("n", "<Leader>3\"", "<Plug>(elin_jack_in)", opts)

      -- Evaluation (replace 'e' with '3')
      vim.keymap.set("n", "<Leader>3i", "<Plug>(elin_eval_current_expr)", opts)
      vim.keymap.set("n", "<Leader>3e", "<Plug>(elin_eval_current_list)", opts)
      vim.keymap.set("n", "<Leader>3t", "<Plug>(elin_eval_current_top_list)", opts)
      vim.keymap.set("n", "<Leader>3b", "<Plug>(elin_eval_current_buffer)", opts)
      vim.keymap.set("n", "<Leader>3n", "<Plug>(elin_eval_ns_form)", opts)
      vim.keymap.set("n", "<Leader>3a", "<Plug>(elin_eval_at_mark)", opts)
      vim.keymap.set("n", "<Leader>3ce", "<Plug>(elin_eval_in_context)", opts)
      vim.keymap.set("n", "<Leader>3p", "<Plug>(elin_print_last_result)", opts)
      vim.keymap.set("n", "<Leader>3q", "<Plug>(elin_interrupt)", opts)
      vim.keymap.set("n", "<Leader>3u", "<Plug>(elin_undef)", opts)
      vim.keymap.set("n", "<Leader>3U", "<Plug>(elin_undef_all)", opts)
      vim.keymap.set("n", "<Leader>3nr", "<Plug>(elin_reload)", opts)
      vim.keymap.set("n", "<Leader>3nR", "<Plug>(elin_reload_all)", opts)
      vim.keymap.set("n", "<Leader>3m", "<Plug>(elin_macro_expand1_current_list)", opts)

      -- Overview (3 prefix)
      vim.keymap.set("n", "<Leader>3oe", "<Plug>(elin_overview_current_list)", opts)
      vim.keymap.set("n", "<Leader>3ot", "<Plug>(elin_overview_current_top_list)", opts)

      -- Refactoring (3 prefix)
      vim.keymap.set("n", "<Leader>3ran", "<Plug>(elin_add_libspec)", opts)
      vim.keymap.set("n", "<Leader>3ram", "<Plug>(elin_add_missing_libspec)", opts)

      -- Navigation (keep some original mappings + 3 prefix alternatives)
      vim.keymap.set("n", "<C-]>", "<Plug>(elin_jump_to_definition)", opts)
      vim.keymap.set("n", "<Leader>3br", "<Plug>(elin_references)", opts)
      vim.keymap.set("n", "<Leader>3blr", "<Plug>(elin_local_references)", opts)

      -- Documentation (keep K + 3 prefix alternatives)
      vim.keymap.set("n", "K", "<Plug>(elin_lookup)", opts)
      vim.keymap.set("n", "<Leader>3hs", "<Plug>(elin_show_source)", opts)
      vim.keymap.set("n", "<Leader>3hc", "<Plug>(elin_show_clojuredocs)", opts)
      vim.keymap.set("n", "<Leader>3hj", "<Plug>(elin_open_javadoc)", opts)

      -- Testing (3 prefix) - Fixed duplicate mapping
      vim.keymap.set("n", "<Leader>3Tt", "<Plug>(elin_test_under_cursor)", opts)
      vim.keymap.set("n", "<Leader>3Tf", "<Plug>(elin_test_focused_current_testing)", opts)
      vim.keymap.set("n", "<Leader>3Tn", "<Plug>(elin_test_in_ns)", opts)
      vim.keymap.set("n", "<Leader>3Tp", "<Plug>(elin_test_all)", opts)
      vim.keymap.set("n", "<Leader>3Tl", "<Plug>(elin_test_last)", opts)
      vim.keymap.set("n", "<Leader>3Tr", "<Plug>(elin_test_last_failed)", opts)
      
      -- Session (3 prefix)
      vim.keymap.set("n", "<Leader>3ss", "<Plug>(elin_toggle_info_buffer)", opts)
      vim.keymap.set("n", "<Leader>3sl", "<Plug>(elin_clear_info_buffer)", opts)
      vim.keymap.set("n", "<Leader>3<Esc>", "<Plug>(elin_clear_virtual_texts)", opts)
    end,
  },
}
