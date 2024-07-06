return {
  {
    'akinsho/git-conflict.nvim',
    config = function()
      require('git-conflict').setup {
        default_mappings = {
          ours = 'co',
          theirs = 'ct',
          both = 'cb',
          next = ']x',
          prev = '[x',
        },
      }

      vim.keymap.set('n', '<leader>gc', function()
        vim.cmd 'GitConflictListQf'
      end, { desc = '[G]it [C]onflicts' })
    end,
  },
}
