return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    config = function()
      local harpoon = require 'harpoon'

      harpoon:setup {
        save_on_toggle = true,
      }

      vim.keymap.set('n', '<leader>ha', function()
        harpoon:list():add()
      end, { desc = '[H]arpoon [A]dd file to list' })
      vim.keymap.set('n', '<leader>ho', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = '[H]arpoon [O]pen list' })

      vim.keymap.set('n', '<M-u>', function()
        harpoon:list():select(1)
      end, { desc = 'View first file in Harpoon list' })

      vim.keymap.set('n', '<M-i>', function()
        harpoon:list():select(2)
      end, { desc = 'View second file in Harpoon list' })

      vim.keymap.set('n', '<M-o>', function()
        harpoon:list():select(3)
      end, { desc = 'View third file in Harpoon list' })

      vim.keymap.set('n', '<M-p>', function()
        harpoon:list():select(4)
      end, { desc = 'View fourth file in Harpoon list' })

      vim.keymap.set('n', '<C-S-P>', function()
        harpoon:list():prev()
      end)
      vim.keymap.set('n', '<C-S-N>', function()
        harpoon:list():next()
      end)
    end,
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
}
