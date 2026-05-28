print("advent of neovim")

require("config.lazy")

vim.opt.number = true

-- Adevent of Neovim
-- Allow p (put) to paste what is in your clipboard buffer!
vim.opt.clipboard = "unnamedplus"
-- This allows us to execute neovim changes in a live setting!
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- Move this to /after
vim.cmd [[ hi @function.builtin.lua guifg=hotpink ]]

-- Basic
vim.opt.linebreak = true
vim.opt.wrap = true
vim.opt.termguicolors = true
vim.opt.cursorline = true

-- advent-of-nvim
-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
--  Changed from vim.highlight.on_yank() -> vim.hl.hl_op()
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.hl.hl_op()
	end,
})

--Markdown
vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "Autoformat markdown on window save",
	pattern = "*.md",
	callback = function()
		local save = vim.fn.winsaveview()
		vim.cmd("normal! gggqG")
		vim.fn.winrestview(save)
	end,
})





--Enable lsps
vim.lsp.enable("lua_ls")
