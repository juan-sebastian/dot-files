local function default_key_mappings()
  if vim.b.iced_default_key_mappings_applied then
    return
  end
  vim.b.iced_default_key_mappings_applied = true

  local function define_mapping(mode, lhs, rhs)
    vim.api.nvim_set_keymap(mode, lhs, rhs, {noremap = true, silent = true})
  end

  define_mapping('n', "<Leader>w'", '<Plug>(iced_connect)')

  -- Evaluating (<Leader>we)
  define_mapping('n', '<Leader>weq', '<Plug>(iced_interrupt)')
  define_mapping('n', '<Leader>weQ', '<Plug>(iced_interrupt_all)')
  define_mapping('n', '<Leader>w"',  '<Plug>(iced_jack_in)')

  if vim.fn.hasmapto('<Plug>(iced_eval)') == 0 then
    define_mapping('n', '<Leader>wei', '<Plug>(iced_eval)<Plug>(sexp_inner_element)``')
    define_mapping('n', '<Leader>wee', '<Plug>(iced_eval)<Plug>(sexp_outer_list)``')
    define_mapping('n', '<Leader>wet', '<Plug>(iced_eval_outer_top_list)')
  end

  if vim.fn.hasmapto('<Plug>(iced_eval_in_context)') == 0 then
    define_mapping('n', '<Leader>wece', '<Plug>(iced_eval_in_context)<Plug>(sexp_outer_list)``')
  end

  if vim.fn.hasmapto('<Plug>(iced_eval_isolatedly)') == 0 then
    define_mapping('n', '<Leader>weoi', '<Plug>(iced_eval_isolatedly)<Plug>(sexp_inner_element)``')
    define_mapping('n', '<Leader>weoe', '<Plug>(iced_eval_isolatedly)<Plug>(sexp_outer_list)``')
  end

  define_mapping('n', '<Leader>wea', '<Plug>(iced_eval_at_mark)')
  define_mapping('n', '<Leader>weca', '<Plug>(iced_eval_in_context_at_mark)')
  define_mapping('n', '<Leader>wel', '<Plug>(iced_eval_last_outer_top_list)')
  define_mapping('v', '<Leader>wee', '<Plug>(iced_eval_visual)')
  define_mapping('n', '<Leader>wen', '<Plug>(iced_eval_ns)')
  define_mapping('n', '<Leader>wep', '<Plug>(iced_print_last)')
  define_mapping('n', '<Leader>web', '<Plug>(iced_require)')
  define_mapping('n', '<Leader>weB', '<Plug>(iced_require_all)')
  define_mapping('n', '<Leader>weu', '<Plug>(iced_undef)')
  define_mapping('n', '<Leader>weU', '<Plug>(iced_undef_all_in_ns)')
  define_mapping('n', '<Leader>weM', '<Plug>(iced_macroexpand_outer_list)')
  define_mapping('n', '<Leader>wem', '<Plug>(iced_macroexpand_1_outer_list)')
  define_mapping('n', '<Leader>wenr', '<Plug>(iced_refresh)')

  -- Testing (<Leader>wt)
  define_mapping('n', '<Leader>wtt', '<Plug>(iced_test_under_cursor)')
  define_mapping('n', '<Leader>wtl', '<Plug>(iced_test_rerun_last)')
  define_mapping('n', '<Leader>wts', '<Plug>(iced_test_spec_check)')
  define_mapping('n', '<Leader>wto', '<Plug>(iced_test_buffer_open)')
  define_mapping('n', '<Leader>wtn', '<Plug>(iced_test_ns)')
  define_mapping('n', '<Leader>wtp', '<Plug>(iced_test_all)')
  define_mapping('n', '<Leader>wtr', '<Plug>(iced_test_redo)')

  -- Stdout buffer (<Leader>ws)
  define_mapping('n', '<Leader>wss', '<Plug>(iced_stdout_buffer_toggle)')
  define_mapping('n', '<Leader>wsl', '<Plug>(iced_stdout_buffer_clear)')
  define_mapping('n', '<Leader>wso', '<Plug>(iced_stdout_buffer_open)')
  define_mapping('n', '<Leader>wsq', '<Plug>(iced_stdout_buffer_close)')

  -- Refactoring (<Leader>wr)
  define_mapping('n', '<Leader>wrcn', '<Plug>(iced_clean_ns)')
  define_mapping('n', '<Leader>wrca', '<Plug>(iced_clean_all)')
  define_mapping('n', '<Leader>wram', '<Plug>(iced_add_missing)')
  define_mapping('n', '<Leader>wran', '<Plug>(iced_add_ns)')
  define_mapping('n', '<Leader>wrtf', '<Plug>(iced_thread_first)')
  define_mapping('n', '<Leader>wrtl', '<Plug>(iced_thread_last)')
  define_mapping('n', '<Leader>wref', '<Plug>(iced_extract_function)')
  define_mapping('n', '<Leader>wraa', '<Plug>(iced_add_arity)')
  define_mapping('n', '<Leader>wrml', '<Plug>(iced_move_to_let)')
  define_mapping('n', '<Leader>wrrs', '<Plug>(iced_rename_symbol)')

  -- Help/Document (<Leader>wh)
  define_mapping('n', 'K',          '<Plug>(iced_document_popup_open)')
  define_mapping('n', '<Leader>whb', '<Plug>(iced_document_open)')
  define_mapping('n', '<Leader>whu', '<Plug>(iced_use_case_open)')
  define_mapping('n', '<Leader>whn', '<Plug>(iced_next_use_case)')
  define_mapping('n', '<Leader>whN', '<Plug>(iced_prev_use_case)')
  define_mapping('n', '<Leader>whq', '<Plug>(iced_document_close)')
  define_mapping('n', '<Leader>whS', '<Plug>(iced_source_show)')
  define_mapping('n', '<Leader>whs', '<Plug>(iced_source_popup_show)')
  define_mapping('n', '<Leader>whc', '<Plug>(iced_clojuredocs_open)')
  define_mapping('n', '<Leader>whh', '<Plug>(iced_command_palette)')

  -- Browsing (<Leader>wb)
  define_mapping('n', '<Leader>wbn', '<Plug>(iced_browse_related_namespace)')
  define_mapping('n', '<Leader>wbs', '<Plug>(iced_browse_spec)')
  define_mapping('n', '<Leader>wbt', '<Plug>(iced_browse_test_under_cursor)')
  define_mapping('n', '<Leader>wbr', '<Plug>(iced_browse_references)')
  define_mapping('n', '<Leader>wbd', '<Plug>(iced_browse_dependencies)')

  -- Jumping cursor (<Leader>wj)
  define_mapping('n', '<C-]>',      '<Plug>(iced_def_jump)')
  define_mapping('n', '<Leader>wjn', '<Plug>(iced_jump_to_next_sign)')
  define_mapping('n', '<Leader>wjN', '<Plug>(iced_jump_to_prev_sign)')
  define_mapping('n', '<Leader>wjl', '<Plug>(iced_jump_to_let)')

  -- Debugging (<Leader>wd)
  define_mapping('n', '<Leader>wdbt', '<Plug>(iced_browse_tapped)')
  define_mapping('n', '<Leader>wdlt', '<Plug>(iced_clear_tapped)')

  -- Misc
  define_mapping('n', '==',         '<Plug>(iced_format)')
  define_mapping('n', '=G',         '<Plug>(iced_format_all)')
  define_mapping('n', '<Leader>w*',  '<Plug>(iced_grep)')
  define_mapping('n', '<Leader>w/',  ':<C-u>IcedGrep<Space>')
  define_mapping('n', '<Leader>wyn', '<Plug>(iced_yank_ns_name)')
end

local function iced_repl_error_handler(lines)
  local items = {}
  for _, line in ipairs(lines) do
    table.insert(items, {filename = "", lnum = 1, col = 1, text = line})
  end

  vim.fn.setqflist(items, 'r')

  vim.cmd("copen")
end

return {
  {
    "guns/vim-sexp",
    config = function()
      vim.g.sexp_filetypes = ""
    end,
    ft = "clojure",
  },
  {
    "liquidz/vim-iced",
    config = function()
      default_key_mappings()
      vim.g["iced#handler#repl_error"] = iced_repl_error_handler
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "clojure",
        callback = default_key_mappings
      })
    end,
    ft = "clojure",
    lazy = false,
  },
  {
    dependencies = { "neoclide/coc.nvim", "liquidz/vim-iced" },
    "liquidz/vim-iced-coc-source",
    ft = "clojure",
  },
}
