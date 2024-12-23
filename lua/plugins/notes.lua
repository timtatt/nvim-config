return {
  'nvim-neorg/neorg',
  lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-neorg/neorg-telescope' },
  },
  config = function()
    local neorg = require 'neorg'
    neorg.setup {
      load = {
        ['core.defaults'] = {},
        ['core.concealer'] = {},
        ['core.completion'] = {
          config = {
            engine = 'nvim-cmp',
          },
        },
        ['core.summary'] = {
          config = {
            strategy = 'default',
          },
        },
        ['core.dirman'] = {
          config = {
            workspaces = {
              mac = '~/Desktop/notes',
            },
            default_workspace = 'mac',
            index = 'index.norg',
            open_last_workspace = true,
          },
        },
        ['core.integrations.telescope'] = {},
      },
    }

    vim.keymap.set('n', '<leader>nt', ':Neorg journal today<CR>', { desc = '[N]eorg Journal [T]oday' })
    vim.keymap.set('n', '<leader>ny', ':Neorg journal yesterday<CR>', { desc = '[N]eorg Journal [Y]esterday' })
    vim.keymap.set('n', '<leader>nr', ':Neorg return<CR>', { desc = '[N]eorg [R]eturn' })
  end,
}
