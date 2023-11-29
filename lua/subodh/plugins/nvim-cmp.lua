return {
    "hrsh7th/nvim-cmp",
    -- load cmp on InsertEnter
    event = "InsertEnter",
    -- these dependencies will only be loaded when cmp loads
    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer", -- source for text in buffer
      "hrsh7th/cmp-path", -- source for file system paths
      "L3MON4D3/LuaSnip", -- snippet engine
      "saadparwaiz1/cmp_luasnip", --for autocompletion
      "rafamadriz/friendly-snippets",-- useful snippets 
    },
    config = function()
      local cmp = require("cmp")

      local luasnip = require("luasnip")
        
      -- loads vscode style snippets from installed plugins (e.g friendly-snippets)
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
          completion = {
              completeopt = "menu,menuone,preview,noselect"
          },
          snippet = {
              --configure how nvim-cmp interacts with snippet engine.
              expand = function(args)
                  luasnip.lsp_expand(args.body)
            end,
          },
      
          sources = cmp.config.sources({
             {name = "nvim_lsp"},
             {name = "luasnip"},
             {name = "buffer"},
             {name = "path"},
      })
    })
    end,
}

