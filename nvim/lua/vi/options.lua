vim.opt.hlsearch = true
vim.wo.number = true
vim.opt.mouse = 'a'
vim.opt.scrolloff = 5
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smartcase = true  -- Case insensitive searching UNLESS /C or capital in search
vim.wo.signcolumn = "yes"
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,noselect'
vim.opt.wrap = false -- No Wrap lines
vim.opt.incsearch = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
-- folds
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
-- appearence
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.laststatus = 0
vim.opt.cmdheight = 0

vim.opt.guicursor = "n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2"
