return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  config = function()
    local snacks = require 'snacks'

    snacks.setup {
      explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      lazygit = { enabled = true },
      gitbrowser = {
        notify = false,
        enabled = true,
        what = 'permalink',
      },
    }
  end,

  keys = {
    {
      '<leader>fe',
      function()
        Snacks.explorer.open()
      end,
      desc = 'Smart picker',
    },
    {
      '<leader>go',
      function()
        Snacks.gitbrowse()
      end,
      desc = 'Smart picker',
    },
    {
      '<leader>sf',
      function()
        Snacks.picker.smart()
      end,
      desc = 'Smart picker',
    },
    {
      '<leader>/',
      function()
        Snacks.picker.grep()
      end,
      desc = 'Search buffer',
    },
    {
      '<leader>sd',
      function()
        Snacks.picker.diagnostics()
      end,
      desc = 'Diagnostics',
    },
    {
      '<leader>sk',
      function()
        Snacks.picker.keymaps()
      end,
      desc = 'Keymaps',
    },
    {
      '<leader>sh',
      function()
        Snacks.picker.help()
      end,
      desc = 'Help Pages',
    },
    {
      '<leader>sw',
      function()
        Snacks.picker.grep_word()
      end,
      desc = 'Visual selection or word',
      mode = { 'n', 'x' },
    },
    {
      '<leader>sr',
      function()
        Snacks.picker.resume()
      end,
      desc = 'Resume',
    },
    {
      '<leader>sg',
      function()
        Snacks.picker.grep()
      end,
      desc = 'Grep',
    },
    {
      '<leader>sp',
      function()
        Snacks.picker.projects {
          dev = { '~/apps' },
        }
      end,
      desc = 'Search Projects',
    },
    {
      '<leader>sn',
      function()
        Snacks.picker.files { cwd = vim.fn.stdpath 'config' }
      end,
    },
    {
      '<leader>sb',
      function()
        Snacks.picker.git_branches()
      end,
    },
    {
      'gd',
      function()
        Snacks.picker.lsp_definitions()
      end,
    },
    {
      '<leader>.',
      function()
        Snacks.scratch()
      end,
      desc = 'Toggle Scratch Buffer',
    },
    {
      'gD',
      function()
        Snacks.picker.lsp_declarations()
      end,
    },
    {
      'gy',
      function()
        Snacks.picker.lsp_type_definitions()
      end,
    },
    {
      'gr',
      function()
        Snacks.picker.lsp_references()
      end,
    },
    {
      'gI',
      function()
        Snacks.picker.lsp_implementations()
      end,
    },
    {
      '<leader>ws',
      function()
        Snacks.picker.lsp_workspace_symbols()
      end,
    },
    {
      '<leader>gs',
      function()
        Snacks.lazygit()
      end,
      desc = 'Lazygit',
    },
    {
      '<leader>ss',
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = 'LSP Symbols',
    },
    {
      '<leader>sS',
      function()
        Snacks.picker.lsp_workspace_symbols()
      end,
      desc = 'LSP Workspace Symbols',
    },
  },
}
