return {
  {
    'stevearc/oil.nvim',
    config = function()
      local oil = require 'oil'

      oil.setup {
        default_file_explorer = true,
        columns = {},
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        experimental_watch_for_changes = true,
        view_options = {
          show_hidden = true,
        },
      }

      vim.api.nvim_create_user_command('E', function()
        oil.open()
      end, {})

      vim.keymap.set('n', '-', oil.open, { desc = 'Open to previous directory' })
    end,
  },
}
