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
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.terraform_fmt,
          null_ls.builtins.formatting.spell,
        },
      }

      vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = '[F]ormat buffer' })
    end,
  },
}
