--plugins/treesitter.lua

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate", 
  
  config = function()
    -- Use config NOT configs 
    local ts_config = require("nvim-treesitter.config")

ts_config.setup({
      ensure_installed = { 
        "lua", 
        "vim", 
        "vimdoc", 
        "query", 
        "markdown", 
        "markdown_inline",
        "bash" 
      },
      
      -- Automatically download the parser if you open a new file type
      auto_install = true, 
    })
  end,
}


-- ====== BROKEN LEGACY VERSION ======
--Gemini details: https://gemini.google.com/share/continue/95480217e1ac
--[[
return {
  {
    --plugin identiffier, in owner/repo format
    --lazy uses this to fetch it from github
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "lua", "python", "c", "javascript", "json", "markdown" }, -- adjust list
      sync_install = false,
      highlight = { enable = true, additional_vim_regex_highlighting = false },
      indent = { enable = true },
      incremental_selection = { enable = true },
      textobjects = { enable = false },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
--]]
