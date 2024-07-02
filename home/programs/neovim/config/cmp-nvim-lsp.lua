local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(client, bufnr)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

require("lspconfig").terraformls.setup{
   capabilities = capabilities,
}
require("lspconfig").rust_analyzer.setup{
   capabilities = capabilities,
}
require("lspconfig").yamlls.setup{
   capabilities = capabilities,
}
require("lspconfig").cssls.setup{
   capabilities = capabilities,
}
require("lspconfig").nil_ls.setup{
   capabilities = capabilities,
}
require("lspconfig").gopls.setup{
   capabilities = capabilities,
   on_attach = on_attach,
}
