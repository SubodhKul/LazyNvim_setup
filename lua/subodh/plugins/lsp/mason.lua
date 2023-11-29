return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        --import mason
        local mason = require("mason")

        --import mason-lspconfig
        local mason_lspconfig = require("mason-lspconfig")

        mason.setup()

        mason_lspconfig.setup({
            ensure_installed = {
                "pyright",
                "lua_ls",
            },
            automatic_installation = true,
            
        })

    end,
    
}

