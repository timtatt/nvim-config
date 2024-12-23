return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = { 'scss', 'bash', 'css', 'c', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc', 'yaml', 'terraform', 'norg' },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    config = function(_, opts)
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup(opts)

      vim.treesitter.language.register('terraform', { 'terraform', 'terraform-vars' })
    end,
  },
}
