return {
  {
    'akinsho/git-conflict.nvim',
    config = function()
      require('git-conflict').setup()

      vim.keymap.set('n', '<leader>gc', function()
        vim.cmd 'GitConflictListQf'
      end, { desc = "[G]it [C]onflicts" })
    end
  }
}
