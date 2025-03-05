return {
  {
    'folke/lazydev.nvim',
    ft = 'lua', -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = 'rafamadriz/friendly-snippets',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept, C-n/C-p for up/down)
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys for up/down)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-e: Hide menu
      -- C-k: Toggle signature help
      --
      -- See the full "keymap" documentation for information on defining your own keymap.
      completion = {
        list = {
          selection = {
            preselect = true,
            auto_insert = false,
          },
        },
      },
      keymap = {
        preset = 'enter',
        ['<Tab>'] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.accept()
            else
              return cmp.select_and_accept()
            end
          end,
          'snippet_forward',
          'fallback',
        },
      },

      appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- Will be removed in a future release
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },
      signature = { enabled = true },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      fuzzy = { implementation = 'prefer_rust_with_warning' },
    },
    opts_extend = { 'sources.default' },
  },
  -- { -- Autocompletion
  --   'hrsh7th/nvim-cmp',
  --   event = 'InsertEnter',
  --   dependencies = {
  --     {
  --       'L3MON4D3/LuaSnip',
  --       build = (function()
  --         if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
  --           return
  --         end
  --         return 'make install_jsregexp'
  --       end)(),
  --       dependencies = {},
  --     },
  --     'saadparwaiz1/cmp_luasnip',
  --     'buschco/nvim-cmp-ts-tag-close',
  --     'hrsh7th/cmp-nvim-lsp',
  --     'hrsh7th/cmp-path',
  --     'luckasRanarison/tailwind-tools.nvim',
  --   },
  --   config = function()
  --     -- See `:help cmp`
  --     local cmp = require 'cmp'
  --     local luasnip = require 'luasnip'
  --     luasnip.config.setup {}
  --
  --     cmp.setup {
  --       snippet = {
  --         expand = function(args)
  --           luasnip.lsp_expand(args.body, {
  --             expand_params = false,
  --           })
  --         end,
  --       },
  --       completion = { completeopt = 'menu,menuone,noinsert' },
  --       performance = {
  --         confirm_resolve_timeout = 150,
  --       },
  --
  --       mapping = cmp.mapping.preset.insert {
  --         ['<C-n>'] = cmp.mapping.select_next_item(),
  --         ['<C-p>'] = cmp.mapping.select_prev_item(),
  --         ['<C-b>'] = cmp.mapping.scroll_docs(-4),
  --         ['<C-f>'] = cmp.mapping.scroll_docs(4),
  --         ['<tab>'] = cmp.mapping.confirm { select = true },
  --         ['<CR>'] = cmp.mapping.confirm { select = true },
  --         ['<C-Space>'] = cmp.mapping.complete {},
  --       },
  --       sources = {
  --         {
  --           name = 'lazydev',
  --           group_index = 0, -- set group index to 0 to skip loading LuaLS completions
  --         },
  --         { name = 'neorg' },
  --         { name = 'nvim-cmp-ts-tag-close' },
  --         { name = 'nvim_lsp' },
  --         { name = 'luasnip' },
  --         { name = 'path' },
  --       },
  --     }
  --   end,
  -- },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    opts = {},
  },
  {
    'windwp/nvim-ts-autotag',
  },
}
