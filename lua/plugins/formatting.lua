return {
  {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
      local conform = require 'conform'
      conform.setup {
        formatters_by_ft = {
          lua = { 'stylua' },
          xml = { 'xmlformatter' },
          python = { 'isort', 'black' },
          javascript = { 'prettier', stop_after_first = true },
          typescript = { 'prettier' },
          typescriptreact = { 'prettier' },
          json = { 'prettier' },
          svg = { 'prettier' },
          go = { 'gofmt', 'goimports' },
          html = { 'prettier' },
          bash = { 'shfmt' },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_format = 'fallback',
        },
      }

      conform.formatters.shfmt = {
        prepend_args = { '-i', '2', '-sr', '-ci' },
      }

      vim.keymap.set('n', '<leader>f', function()
        local clients = vim.lsp.get_clients {
          bufnr = vim.api.nvim_get_current_buf(),
          name = 'ts_ls',
        }
        if #clients > 0 then
          require('typescript').organize_imports()
        end

        conform.format { bufnr = vim.api.nvim_get_current_buf() }
      end, { desc = '[F]ormat buffer' })
    end,
  },
}
