print("advent of neovim")
require("config.lazy")

-- ==== GREAT Advent of Neovim ====
vim.opt.clipboard = "unnamedplus"
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- Basic
vim.opt.linebreak = true
vim.opt.wrap = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.api.nvim_set_hl(0, "Comment", { fg = "#FF0000" })
vim.opt.scrolloff = 10

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.hl_op()
  end,
})

-- ==== Terminal
vim.api.nvim_create_autocmd('TermOpen', {
  desc = 'Custom terminal setup',
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.relativenumber = false
    vim.opt.linebreak = false
  end,
})

vim.keymap.set("n", "<space>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 5)
end)

-- Dir Tree
vim.keymap.set("n", "<space>dt", function()
  vim.cmd.vnew()
  vim.cmd.wincmd("H") --move to far left
  vim.api.nvim_win_set_width(0, 30)
  vim.cmd("Oil")
end)

-- ==== Markdown
vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "Autoformat markdown on window save",
  pattern = "*.md",
  callback = function()
    local save = vim.fn.winsaveview()
    vim.cmd("normal! gggqG")
    vim.fn.winrestview(save)
  end,
})

-- Global LSP Attach Hook (Applies to ALL enabled servers)
-- vim.api.nvim_create_autocmd("LspAttach", {
--   group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
--   callback = function(args)
--     local client = vim.lsp.get_client_by_id(args.data.client_id)
--     if not client then return end
--
--     -- Global Format-on-Save
--     if client:supports_method("textDocument/formatting") then
--       vim.api.nvim_create_autocmd("BufWritePre", {
--         buffer = args.buf,
--         callback = function()
--           vim.lsp.buf.format({ bufnr = args.buf, id = client.id,
--           options = {
--             tabSize = vim.bo[args.buf].shiftwidth,
--             insertSpaces = vim.bo[args.buf].expandtab,
--           }})
--         end,
--       })
--     end
--   end,
-- })
--
--Enable lsps
vim.lsp.enable("lua_ls")
vim.lsp.enable("ty")
