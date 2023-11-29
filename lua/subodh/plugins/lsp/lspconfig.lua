return {
    "neovim/nvim-lspconfig",
    event = {"BufReadPre","BufNewFile"},
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",

        config = function()
            --import lspconfig plugin
            local lspconfig = require("lspconfig")
            local cmp_nvim_lsp = require("cmp_nvim_lsp")

            local keymap = vim.keymap -- for conciseness

            local opts = { noremap = true, silent = true }
            local on_attach = function(client, bufnr)
                opts.buffer = bufnr
                -- set keybinds
                opts.desc = "show lsp references"
                keymap.set("n", "gr", "<cmd>telescope lsp_references<cr>", opts) -- show definition, references

                opts.desc = "go to declaration"
                keymap.set("n", "gd", vim.lsp.buf.declaration, opts) -- go to declaration

                opts.desc = "show lsp definitions"
                keymap.set("n", "gd", "<cmd>telescope lsp_definitions<cr>", opts) -- show lsp definitions

                opts.desc = "show lsp implementations"
                keymap.set("n", "gi", "<cmd>telescope lsp_implementations<cr>", opts) -- show lsp implementations

                opts.desc = "show lsp type definitions"
                keymap.set("n", "gt", "<cmd>telescope lsp_type_definitions<cr>", opts) -- show lsp type definitions

                opts.desc = "see available code actions"
                keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
            end
        -- used to enable autocompletion (assign every lsp server config) 
        local capabilities = cmp_nvim_lsp.default_capabilities()

        --configure python server
        lspconfig["pyright"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })
        end,
    }
}
