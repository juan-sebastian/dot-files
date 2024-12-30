return {
  {
    "neoclide/coc.nvim",
    branch = "release",
    init = function()
      -- Some servers have issues with backup files, see #649.
      vim.opt.backup = false
      vim.opt.writebackup = false
      -- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
      -- delays and poor user experience.
      vim.opt.updatetime = 300
      -- Always show the signcolumn, otherwise it would shift the text each time
      -- diagnostics appear/become resolved.
      vim.opt.signcolumn = "yes"
      local keyset = vim.keymap.set
      -- Auto complete
      function _G.check_back_space()
          local col = vim.fn.col('.') - 1
          return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
      end
      local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
      -- Make <CR> to accept selected completion item or notify coc.nvim to format
      -- <C-g>u breaks current undo, please make your own choice.
      keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
      -- Use `[g` and `]g` to navigate diagnostics
      -- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
      keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
      keyset("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})
      -- GoTo code navigation.
      keyset("n", "gd", "<Plug>(coc-definition)", {silent = true})
      keyset("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
      keyset("n", "gi", "<Plug>(coc-implementation)", {silent = true})
      keyset("n", "gr", "<Plug>(coc-references)", {silent = true})
      keyset("n", "ga", "<Plug>(coc-codeaction-cursor)", {silent = true})
      -- Use K to show documentation in preview window.
      function _G.show_docs()
          local cw = vim.fn.expand('<cword>')
          if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
              vim.api.nvim_command('h ' .. cw)
          elseif vim.api.nvim_eval('coc#rpc#ready()') then
              vim.fn.CocActionAsync('doHover')
          else
              vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
          end
      end
      keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})
      -- Highlight the symbol and its references when holding the cursor.
      vim.api.nvim_create_augroup("CocGroup", {})
      vim.api.nvim_create_autocmd("CursorHold", {
          group = "CocGroup",
          command = "silent call CocActionAsync('highlight')",
          desc = "Highlight symbol under cursor on CursorHold"
      })
      -- Symbol renaming.
      keyset("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})
      -- Setup formatexpr specified filetype(s).
      vim.api.nvim_create_autocmd("FileType", {
          group = "CocGroup",
          pattern = "typescript,json",
          command = "setl formatexpr=CocAction('formatSelected')",
          desc = "Setup formatexpr specified filetype(s)."
      })
      -- Update signature help on jump placeholder.
      vim.api.nvim_create_autocmd("User", {
          group = "CocGroup",
          pattern = "CocJumpPlaceholder",
          command = "call CocActionAsync('showSignatureHelp')",
          desc = "Update signature help on jump placeholder"
      })
      -- Add `:Format` command to format current buffer.
      vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})
      -- " Add `:Fold` command to fold current buffer.
      vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", {nargs = '?'})
      -- Add `:OR` command for organize imports of the current buffer.
      vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})
      -- Add (Neo)Vim's native statusline support.
      -- NOTE: Please see `:h coc-status` for integrations with external plugins that
      -- provide custom statusline: lightline.vim, vim-airline.
      vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")
      -- Mappings for CoCList
      -- code actions and coc stuff
      ---@diagnostic disable-next-line: redefined-local
      local opts = {silent = true, nowait = true}
      -- Show all diagnostics.
      keyset("n", "<space>a", ":<C-u>CocList diagnostics<cr>", opts)
      -- Manage extensions.
      keyset("n", "<space>e", ":<C-u>CocList extensions<cr>", opts)
      -- Show commands.
      keyset("n", "<space>c", ":<C-u>CocList commands<cr>", opts)
      -- Find symbol of current document.
      keyset("n", "<space>o", ":<C-u>CocList outline<cr>", opts)
      -- Search workspace symbols.
      keyset("n", "<space>s", ":<C-u>CocList -I symbols<cr>", opts)
      -- Do default action for next item.
      keyset("n", "<space>j", ":<C-u>CocNext<cr>", opts)
      -- Do default action for previous item.
      keyset("n", "<space>k", ":<C-u>CocPrev<cr>", opts)
      -- Resume latest coc list.
      keyset("n", "<space>p", ":<C-u>CocListResume<cr>", opts)

    end,
  },
}
