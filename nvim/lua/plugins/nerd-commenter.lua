return {
  {
    'preservim/nerdcommenter',
    dependencies = {
      'Shougo/context_filetype.vim'
    },
    config = function()
      vim.g.NERDSpaceDelims = 1
      vim.g.NERDCompactSexyComs = 1
      vim.g.NERDCustomDelimiters = {
        html = { left = '<!--', right = '-->' },
      }
      vim.g.NERDDefaultAlign = 'left'

      vim.cmd([[
        if !exists('g:context_filetype#filetypes')
          let g:context_filetype#filetypes = {}
        endif

        let g:context_filetype#filetypes.svelte =
        \ [
        \   {'filetype' : 'javascript', 'start' : '<script>', 'end' : '</script>'},
        \   {
        \     'filetype': 'typescript',
        \     'start': '<script\%( [^>]*\)\? \%(ts\|lang="\%(ts\|typescript\)"\)\%( [^>]*\)\?>',
        \     'end': '</script>',
        \   },
        \   {'filetype' : 'css', 'start' : '<style \?.*>', 'end' : '</style>'},
        \ ]

        let g:ft = ''
      ]])

      vim.cmd([[
        fu! NERDCommenter_before()
          if (&ft == 'html') || (&ft == 'svelte')
            let g:ft = &ft
            let cfts = context_filetype#get_filetypes()
            if len(cfts) > 0
              if cfts[0] == 'svelte'
                let cft = 'html'
              elseif cfts[0] == 'scss'
                let cft = 'css'
              else
                let cft = cfts[0]
              endif
              exe 'setf ' . cft
            endif
          endif
        endfu

        fu! NERDCommenter_after()
          if exists('g:ft') && ((g:ft == 'html') || (g:ft == 'svelte'))
            exec 'setf ' . g:ft
            let g:ft = ''
          endif
        endfu
      ]])
    end,
    lazy = false,
  },
}
