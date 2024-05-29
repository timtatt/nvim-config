return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      icons_enabled = true,
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', { 'filename', path = 1 } },
        lualine_c = {},
        lualine_x = { 'filetype', 'fileformat' },
        lualine_y = { 'diagnostics' },
        lualine_z = { 'selectioncount', 'location' },
      },
    },
  },
}
