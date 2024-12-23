return {
  {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
      local conform = require 'conform'
      conform.setup {
        formatters_by_ft = {
          lua = { 'stylua' },
          python = { 'isort', 'black' },
          javascript = { 'prettierd', 'prettier', stop_after_first = true },
          html = { 'prettierd' },
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
          name = 'tsserver',
        }
        if #clients > 0 then
          require('typescript').organize_imports()
        end

        conform.format { bufnr = vim.api.nvim_get_current_buf() }
      end, { desc = '[F]ormat buffer' })
    end,
  },
}
