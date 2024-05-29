local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

return {
  {
    'nvimtools/none-ls.nvim',
    config = function()
      local null_ls = require 'null-ls'

      null_ls.setup {
        debug = false,
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.yapf.with {
            extra_args = {
              '--style={based_on_style: pep8, indent_width: 2, column_limit: 120, continuation_indent_width: 2, each_dict_entry_on_separate_line: True}',
            },
          },
          null_ls.builtins.formatting.prettierd.with {
            env = {
              PRETTIERD_DEFAULT_CONFIG = '~/.config/nvim/config/prettier.config.js',
            },
          },
          null_ls.builtins.formatting.terraform_fmt,
        },
      }

      vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = '[F]ormat buffer' })

      vim.api.nvim_clear_autocmds { group = augroup }
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        callback = function()
          vim.lsp.buf.format()
        end,
      })
    end,
  },
}
