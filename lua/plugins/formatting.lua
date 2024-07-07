return {
  {
    'nvimtools/none-ls.nvim',
    dependencies = {
      'lukas-reineke/lsp-format.nvim',
    },
    config = function()
      local null_ls = require 'null-ls'

      local lsp_format = require 'lsp-format'

      lsp_format.setup {}

      null_ls.setup {
        debug = false,
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.rustywind,
          null_ls.builtins.formatting.yapf.with {
            extra_args = {
              '--style={based_on_style: pep8, indent_width: 2, column_limit: 120, continuation_indent_width: 2, each_dict_entry_on_separate_line: True}',
            },
          },
          null_ls.builtins.formatting.shfmt.with {
            extra_args = { '-i', '2', '-sr', '-ci' },
          },
          null_ls.builtins.formatting.prettier.with {
            env = {
              PRETTIER_DEFAULT_CONFIG = '~/.config/nvim/config/prettier.config.js',
            },
          },
          null_ls.builtins.formatting.terraform_fmt,
          null_ls.builtins.diagnostics.sqlfluff.with {
            extra_args = { '--dialect', 'postgres' },
          },
        },
        on_attach = lsp_format.on_attach,
      }

      vim.keymap.set('n', '<leader>f', function()
        local clients = vim.lsp.buf_get_clients(vim.api.nvim_get_current_buf())
        print(vim.inspect(clients))
        for _, client in ipairs(clients) do
          require('typescript').organize_imports()
        end

        lsp_format.format {
          buf = vim.api.nvim_get_current_buf(),
        }
      end, { desc = '[F]ormat buffer' })
    end,
  },
}
