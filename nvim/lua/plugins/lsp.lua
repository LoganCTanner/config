return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lspconfig = require("lspconfig")

    -- Capabilities for cmp integration
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Python
    lspconfig.pyright.setup {
      capabilities = capabilities
    }

    -- Web stack
    lspconfig.tsserver.setup {
      capabilities = capabilities
    }

    lspconfig.html.setup {
      capabilities = capabilities
    }

    lspconfig.cssls.setup {
      capabilities = capabilities
    }

    -- JSON (optional)
    lspconfig.jsonls.setup {
      capabilities = capabilities
    }

    -- C#/.NET
    lspconfig.omnisharp.setup {
        capabilities = capabilities,
        cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
        enable_editorconfig_support = true,
        enable_roslyn_analyzers = true,
        organize_imports_on_format = true,
        root_dir = lspconfig.util.root_pattern("*.sln", "*csproj", ".git"),
    }
  end,
}
