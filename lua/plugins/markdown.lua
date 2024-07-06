return {
  {
    'tadmccorkle/markdown.nvim',
    ft = 'markdown',
    config = function()
      require('markdown').setup {
        mappings = {
          inline_surround_toggle = 'mt',
          inline_surround_toggle_line = 'mtt',
          inline_surround_delete = 'md',
          inline_surround_change = 'mc',
          link_add = 'mla',
        },
      }

      vim.keymap.set('n', 'mrn', ':MDResetListNumbering<CR>', { desc = '[M]arkdown [R]eset [N]umbering' })
    end,
  },
}
