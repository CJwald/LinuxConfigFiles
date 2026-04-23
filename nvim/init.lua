
vim.opt.expandtab = true   -- use spaces instead of real tabs
vim.opt.shiftwidth = 4     -- indentation size
vim.opt.tabstop = 4        -- how wide a tab appears
vim.opt.softtabstop = 4    -- how many spaces a <Tab> inserts

vim.opt.compatible = false
vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")

-- Force Fortran syntax for .txt
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.txt",
    command = "setlocal syntax=fortran",
})

vim.opt.path:append("**")
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:list,full"

vim.opt.backspace = "indent,eol,start"
vim.opt.numberwidth = 4

-- UI behavior
vim.opt.showmatch = true
vim.opt.showcmd = true
vim.opt.cursorline = false
vim.opt.lazyredraw = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.mouse = "a"
vim.opt.colorcolumn = "80"

-- Search
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true


-- Folding
-- vim.opt.foldmethod = "indent"
-- vim.opt.foldnestmax = 10
-- vim.opt.foldenable = true
-- vim.opt.foldlevelstart = 10

-- Clipboard
-- vim.opt.clipboard = "unnamedplus"

-- Paste mode
vim.opt.paste = true

-- Timeout
vim.opt.timeoutlen = 300

-- =========================
-- Keymaps
-- =========================
vim.g.mapleader = " "

vim.keymap.set("n", "<space>", "za", { noremap = true })
vim.keymap.set("n", "j", "jzzzv", { noremap = true })
vim.keymap.set("n", "k", "kzzzv", { noremap = true })
vim.keymap.set("x", "p", "\"_dP", { noremap = true })

vim.keymap.set("i", "jk", "<Esc>", { noremap = true })
vim.keymap.set("i", "kj", "<Esc>", { noremap = true })

-- =========================
-- Center cursor on open/move
-- =========================
vim.api.nvim_create_autocmd({"BufReadPost", "BufNewFile", "BufWinEnter"}, {
    callback = function()
        vim.cmd("normal! zz")
    end,
})

-- =========================
-- Cursor shape (terminal)
-- =========================
vim.opt.guicursor = "n-v-c:block,i:ver25"

-- =========================
-- Netrw
-- =========================
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0

vim.opt.termguicolors = true
vim.opt.background = "dark"

-- =========================
-- Highlight groups (your colors)
-- =========================
local set_hl = vim.api.nvim_set_hl

set_hl(0, "LineNr",        { fg = "#514e54", bg = "NONE" })
set_hl(0, "Cursor",        { fg = "#ffffff", bg = "#a8351b" })
set_hl(0, "CursorLineNr",  { fg = "#a8351b", bg = "NONE" })
set_hl(0, "CursorLine",    { fg = "#ffffff", bg = "NONE" })
set_hl(0, "VertSplit",     { fg = "#ffffff", bg = "NONE" })
set_hl(0, "StatusLine",    { fg = "#ffffff", bg = "NONE" })
set_hl(0, "StatusLineNC",  { fg = "#ffffff", bg = "NONE" })
set_hl(0, "ColorColumn",   { bg = "#303030" })
set_hl(0, "Visual",        { bg = "#455040" })
set_hl(0, "Search",        { bg = "#404040" })
set_hl(0, "IncSearch",     { fg = "#ffffff" })
set_hl(0, "Pmenu",         { fg = "#ffffff" })
set_hl(0, "PmenuSel",      { fg = "#ffffff" })
set_hl(0, "SpecialKey",    { fg = "#39363d" })
set_hl(0, "NonText",       { fg = "#000000" })

set_hl(0, "Comment",   { fg = "#606060" })
set_hl(0, "Constant",  { fg = "#b1d404" })
set_hl(0, "Identifier",{ fg = "#7d69bf" })
set_hl(0, "Statement", { fg = "#97ff78" })
set_hl(0, "PreProc",   { fg = "#849470" })
set_hl(0, "Type",      { fg = "#849470" })
set_hl(0, "Special",   { fg = "#ffffff" })
set_hl(0, "Todo",      { fg = "#ff0f00", bg = "#202020" })







-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  print("Installing lazy.nvim...")
  vim.fn.system({
    "git",
    "clone",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)



require("lazy").setup({
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "c", "cpp" },
				highlight = { enable = true },
			})
		end,
	},
})

require("nvim-treesitter.configs").setup({
	ensure_installed = { "c", "cpp", "lua", "bash", "python" },
	auto_install = true,
	highlight = { enable = true },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",   -- start selection
			node_incremental = "<CR>", -- expand
			node_decremental = "<BS>", -- shrink
			scope_incremental = "<TAB>",
		},
	},
})

