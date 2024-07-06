local cmp = require("cmp")
-- local cmp_format = require("lsp-zero").cmp_format({details = true})
local cmp_action = require("lsp-zero").cmp_action()

cmp.setup({
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
  },
  formatting = {
      fields = {'abbr', 'kind', 'menu'},
      format = require('lspkind').cmp_format({
        mode = 'symbol', -- show only symbol annotations
        maxwidth = 50, -- prevent the popup from showing more than provided characters
        ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
      })
  },
--   formatting = {
-- -- changing the order of fields so the icon is the first
--     fields = {'menu', 'abbr', 'kind'},
--
--     -- here is where the change happens
--     format = function(entry, item)
--       local menu_icon = {
--         nvim_lsp = 'λ',
--         luasnip = '⋗',
--         buffer = 'Ω',
--         path = '🖫',
--         nvim_lua = 'Π',
--       }
--
--       item.menu = menu_icon[entry.source.name]
--       return item
--     end,
--   },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
})
