return {
  {
    dependencies = { 'echasnovski/mini.icons' },
    'A7Lavinraj/fyler.nvim',
    config = function()
      local fyler = require 'fyler'

      fyler.setup {
        default_file_explorer = true,
        close_on_select = true,
        views = {
          explorer = {
            win = {
              kind = 'float',
            },
          },
        },
      }

      vim.keymap.set('n', '-', function()
        fyler.open {
          cwd = Snacks.git.get_root(),
        }
      end)
    end,
  },
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
        keymaps = {
          ['g?'] = 'actions.show_help',
          ['<CR>'] = 'actions.select',
          ['<C-s>'] = { 'actions.select_split', opts = { vertical = true } },
          ['<C-p>'] = 'actions.preview',
          ['gx'] = 'actions.open_external',
        },
        use_default_keymaps = false,
        lsp_file_methods = {
          autosave_changes = true,
        },
        view_options = {
          is_hidden_file = function(name)
            return name == '.DS_Store'
          end,
        },
      }

      vim.keymap.set('n', '_', oil.open, { desc = 'Open to previous directory' })
      vim.keymap.set('n', 'go', function()
        if vim.bo.filetype == 'oil' then
          vim.cmd('!open ' .. oil.get_current_dir())
        end
      end, { desc = '[O]pen directory in Finder' })
    end,
  },
}
