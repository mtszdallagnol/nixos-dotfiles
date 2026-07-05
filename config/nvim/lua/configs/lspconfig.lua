require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "nixd", "basedpyright", "ruff", "zls", "rust_analyzer" }

vim.lsp.config("zls", {
  settings = {
    zls = {
      enable_argument_placeholders = false,
    },
  },
})

vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
