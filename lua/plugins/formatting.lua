local lsp_formatting = function(bufnr)
  vim.lsp.buf.format {
    filter = function(client)
      -- only use null-ls for formatting
      return client.name == 'null-ls' or client.name == 'gopls'
    end,
    bufnr = bufnr,
  }
end
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
          null_ls.builtins.formatting.shfmt.with {
            extra_args = { '-i', '2', '-sr', '-ci' },
          },
          null_ls.builtins.formatting.prettierd.with {
            env = {
              PRETTIERD_DEFAULT_CONFIG = '~/.config/nvim/config/prettier.config.js',
            },
          },
          null_ls.builtins.formatting.terraform_fmt,
        },
        on_attach = function(_, bufnr)
          vim.api.nvim_clear_autocmds { group = augroup }
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            callback = function()
              lsp_formatting(bufnr)
            end,
          })
        end,
      }

      vim.keymap.set('n', '<leader>f', function(bufnr)
        lsp_formatting(bufnr)
      end, { desc = '[F]ormat buffer' })
    end,
  },
}
