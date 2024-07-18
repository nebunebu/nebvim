require("neb.options")
require("neb.colorscheme")
-- require("neb.plugins.mkdnflow")
require("neb.plugins.fortune") -- must be before alpha
require("neb.plugins.alpha")
require("neb.plugins.autopairs")
require("neb.plugins.barbecue")
require("neb.plugins.conform")
require("neb.plugins.direnv")
require("neb.plugins.endwise")
require("neb.plugins.image")
require("neb.plugins.img-clip")
require("neb.plugins.lint")
require("neb.plugins.lualine")
require("neb.plugins.luasnip")
require("neb.plugins.markdown-toc")
require("neb.plugins.markview")
require("neb.plugins.rainbow-delimiters")
require("neb.plugins.treesitter")
require("neb.plugins.triptych")
require("neb.plugins.which-key")

-- NOTE: Lsp
require("neb.plugins.lsp.lsp-zero")
require("neb.plugins.lsp.lspconfig")
require("neb.plugins.lsp.fidget")

-- NOTE: Cmp
require("neb.plugins.cmp")
