return {
  { 'NMAC427/guess-indent.nvim' },
  {
    'j-hui/fidget.nvim',
    opts = {},
  },
  {
    'chentoast/marks.nvim',
    opts = {
      default_mappings = false,
    },
  },
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    config = function()
      require('which-key').setup()

      -- Document existing key chains
      require('which-key').add {
        { '<leader>c', { group = '[C]ode' } },
        { '<leader>d', { group = '[D]ocument' } },
        { '<leader>r', { group = '[R]ename' } },
        { '<leader>s', { group = '[S]earch' } },
        { '<leader>w', { group = '[W]orkspace' } },
      }
    end,
  },
  { -- Highlight todo, notes, etc in comments
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
}
