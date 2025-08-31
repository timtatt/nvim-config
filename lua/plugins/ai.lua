return {
  {
    'github/copilot.vim',
    config = function()
      vim.g.copilot_enabled = true
      vim.g.copilot_workspace_folders = { '~/apps' }
      vim.g.copilot_file_types = {
        ['*'] = false,
        go = true,
        lua = true,
        javascript = true,
        typescript = true,
        python = true,
        markdown = true,
      }

      vim.keymap.set('i', '<M-l>', 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
      })
      vim.g.copilot_no_tab_map = true
    end,
  },
}
