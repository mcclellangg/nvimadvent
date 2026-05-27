-- plugins/lsp.lua
return {
  {
    -- Currently not sure how to set this up with the new style of lsp
    -- Come back later ...
    enabled = false,
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
}
