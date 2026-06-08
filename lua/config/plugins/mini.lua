-- lua/custom/plugins/mini.lua
return {
  {
    enabled = true,
    'echasnovski/mini.nvim',
    config = function()
      local statusline = require('mini.statusline')
      statusline.setup({ use_icons = true })

      local mini_icons = require('mini.icons')
      mini_icons.setup({ style = "glyph" })
    end
  }
}
