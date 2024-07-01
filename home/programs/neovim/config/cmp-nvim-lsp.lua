local capabilities = require('cmp_nvim_lsp').default_capabilities()

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

