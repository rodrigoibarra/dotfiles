local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- ── Highlight on yank ─────────────────────────────────────────────────────
autocmd("TextYankPost", {
	group = augroup("highlight_yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 150 })
	end,
})

-- ── Python indentation override ───────────────────────────────────────────
autocmd("FileType", {
	group = augroup("python_indent", { clear = true }),
	pattern = "python",
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
	end,
})

-- ── Remove trailing whitespace on save ───────────────────────────────────
autocmd("BufWritePre", {
	group = augroup("trim_whitespace", { clear = true }),
	pattern = "*",
	callback = function()
		local pos = vim.api.nvim_win_get_cursor(0)
		vim.cmd([[%s/\s\+$//e]])
		vim.api.nvim_win_set_cursor(0, pos)
	end,
})

-- ── Auto-resize splits on terminal resize ────────────────────────────────
autocmd("VimResized", {
	group = augroup("resize_splits", { clear = true }),
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

-- ── Restore cursor position on file open ─────────────────────────────────
autocmd("BufReadPost", {
	group = augroup("restore_cursor", { clear = true }),
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- ── MDX filetype detection ────────────────────────────────────────────────
vim.filetype.add({
	extension = {
		mdx = "markdown",
	},
})
