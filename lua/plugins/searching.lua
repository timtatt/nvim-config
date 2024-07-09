return {
  {
    -- automatically removes the search highlighting after navigation is complete
    'nvimdev/hlsearch.nvim',
    config = function()
      require('hlsearch').setup()
    end,
  },
  {
    -- allows searching for word under cursor
    'backdround/improved-search.nvim',
    config = function()
      local search = require 'improved-search'

      vim.keymap.set('n', '?', search.current_word)
      vim.keymap.set('x', '?', search.in_place)
    end,
  },
}
