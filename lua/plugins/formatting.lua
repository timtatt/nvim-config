return {
  {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
      require('conform').setup {
        formatters_by_ft = {
          lua = { 'stylua' },
          -- Conform will run multiple formatters sequentially
          python = { 'isort', 'black' },
          -- You can customize some of the format options for the filetype (:help conform.format)
          rust = { 'rustfmt', lsp_format = 'fallback' },
          -- Conform will run the first available formatter
          javascript = { 'prettierd', 'prettier', stop_after_first = true },
        },
        format_on_save = {
          -- These options will be passed to conform.format()
          timeout_ms = 500,
          lsp_format = 'fallback',
        },
      }

      require('conform').formatters.shfmt = {
        prepend_args = { '-i', '2', '-sr', '-ci' },
      }

      vim.keymap.set('n', '<leader>f', function()
        local clients = vim.lsp.buf_get_clients(vim.api.nvim_get_current_buf())
        print(vim.inspect(clients))
        for _, client in ipairs(clients) do
          require('typescript').organize_imports()
        end

        require('conform').format { bufnr = vim.fn.nvim_get_current_buf() }
      end)
    end,
  },
}
