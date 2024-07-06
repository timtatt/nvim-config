return {
  {
    'numToStr/Comment.nvim',
    opts = {
      mappings = {
        basic = true,
        extra = true,
      },
    },
  },
  {
    'danymat/neogen',
    config = function()
      require('neogen').setup {}
      vim.keymap.set({ 'n', 'v' }, '<leader>cc', ':Neogen class<CR>', { desc = 'Generate [C]omment' })
    end,
  },
}
