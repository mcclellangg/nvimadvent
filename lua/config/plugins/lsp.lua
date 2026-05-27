-- plugins/lsp.lua
return {
  {
    dependencies = {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
    -- just by typing this in it clones the repo
    "https://github.com/neovim/nvim-lspconfig",
    config = function()
      -- LEGACY require, to be depreceated
      require('lspconfig').lua_ls.setup {}
      -- vim.lsp.config('lua_ls', {})
    end,
  }
}
