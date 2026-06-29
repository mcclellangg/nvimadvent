-- lua/config/plugins/love2d.lua

return {
  'S1M0N38/love2d.nvim',
  version = '3.*', -- Pinning to version 3 as recommended by the author
  event = 'VeryLazy',
  opts = {},
  keys = {
    { '<leader>v',  desc = 'Run LÖVE' },
    { '<leader>vr', '<cmd>Love run<cr>',    desc = 'Run LÖVE' },
    { '<leader>vw', '<cmd>Love watch<cr>',  desc = 'Watch LÖVE' },
    { '<leader>vi', '<cmd>Love info<cr>',   desc = 'Info LÖVE' },
    { '<leader>vs', '<cmd>Love stop<cr>',   desc = 'Stop LÖVE' },
    { '<leader>vo', '<cmd>Love output<cr>', desc = 'Output panel' },
  }
}
