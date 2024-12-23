return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  },
  {
    'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  },
}
