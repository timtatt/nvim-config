return {
  {
    'numToStr/Comment.nvim',
    opts = {
      mappings = {
        basic = false,
        extra = false,
      },
    },
    config = function()
      local api = require 'Comment.api'
      vim.keymap.set({ 'n', 'i' }, '<C-/>', api.toggle.linewise.current, { desc = 'Toggle comment on current line' })
      vim.keymap.set('v', '<C-/>', function()
        vim.api.nvim_feedkeys('<Esc>', 'nx', false)
        api.toggle.linewise(vim.fn.visualmode())
        vim.api.nvim_feedkeys('gv', 'nv', false)
      end, { desc = 'Toggle comment on selection' })
    end,
  },
}
