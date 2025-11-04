return {
  {
    'zeioth/garbage-day.nvim',
    dependencies = 'neovim/nvim-lspconfig',
    event = 'VeryLazy',
    opts = {},
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'mason-org/mason.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = function()
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = '[R]e[n]ame' })
          vim.keymap.set('n', '<leader>cc', vim.lsp.buf.code_action, { desc = '[C]ode Action' })
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
        end,
      })

      local ensure_installed = {
        'stylua',
        'prettier',
        'isort',
        'black',
        'css-lsp',
        'yaml-language-server',
        'bash-language-server',
        'lua-language-server',
        'json-lsp',
        'gopls',
        'python-lsp-server',
        'html-lsp',
      }

      require('mason-tool-installer').setup { ensure_installed = ensure_installed }
      require('mason').setup()

      vim.lsp.set_log_level 'INFO'
      vim.lsp.enable 'gopls'
      vim.lsp.enable 'html'
      vim.lsp.enable 'cssls'
      vim.lsp.enable 'yamlls'
      vim.lsp.enable 'bashls'
      vim.lsp.enable 'jsonls'
      vim.lsp.enable 'pylsp'
      vim.lsp.enable 'lua_ls'
    end,
  },
}
