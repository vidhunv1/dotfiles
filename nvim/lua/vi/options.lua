vim.opt.hlsearch = true
vim.wo.number = true
vim.opt.mouse = "a"
vim.opt.scrolloff = 5
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smartcase = true -- Case insensitive searching UNLESS /C or capital in search
vim.wo.signcolumn = "yes"
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.completeopt = "menuone,noselect"
vim.opt.wrap = true
vim.opt.incsearch = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.cmdheight = 0
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
vim.opt.guicursor = "n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2"
vim.opt.winbar = "      %f"
vim.opt.laststatus = 3
vim.opt.number = true
vim.opt.relativenumber = true

local hr = tonumber(os.date("%H", os.time()))
if hr >= 6 and hr <= 19 then -- day between 6am and 9pm
	vim.opt.background = "light"
else
	vim.opt.background = "dark"
end
