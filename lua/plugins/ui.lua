return {
  {
    'stevearc/dressing.nvim',
    opts = {
      input = {
        insert_only = false,
        start_in_insert = false,
      },
    },
  },
  {
    'chentoast/marks.nvim',
    config = function()
      require('marks').setup {
        default_mappings = false,
      }
    end,
  },
}
