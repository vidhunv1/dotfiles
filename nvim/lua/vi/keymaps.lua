local keymap = vim.keymap

keymap.set("x", "<leader>p", '"_dP')

keymap.set("v", "J", ":m '>+2<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv-gv")

keymap.set("n", "<leader>y", '"+y')
keymap.set("v", "<leader>y", '"+y')
keymap.set("n", "<leader>Y", '"+Y')

-- Move window
keymap.set("", "<C-h>", "<C-w>h")
keymap.set("", "<C-k>", "<C-w>k")
keymap.set("", "<C-j>", "<C-w>j")
keymap.set("", "<C-l>", "<C-w>l")

-- Remove highlight
keymap.set("n", "<ESC>", "<cmd> noh <CR>")

-- keep cursor in same position when joining lines
keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Option + backspace to delete word in insert mode
keymap.set("i", "<M-BS>", "<C-w>")

-- remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- close all other buffers but the current
keymap.set("n", "<leader>o", ":silent %bd|e#|bd#<cr>")
keymap.set("n", "<leader>q", ":b#|bd#<cr>")
keymap.set("n", "gq", "<C-w>q")

-- easy goto buffer
keymap.set("n", "<leader>1", ":LualineBuffersJump! 1<cr>")
keymap.set("n", "<leader>2", ":LualineBuffersJump! 2<cr>")
keymap.set("n", "<leader>3", ":LualineBuffersJump! 3<cr>")
keymap.set("n", "<leader>4", ":LualineBuffersJump! 4<cr>")
keymap.set("n", "<leader>5", ":LualineBuffersJump! 5<cr>")
keymap.set("n", "<leader>6", ":LualineBuffersJump! 6<cr>")
keymap.set("n", "<leader>7", ":LualineBuffersJump! 7<cr>")
keymap.set("n", "<leader>8", ":LualineBuffersJump! 8<cr>")
keymap.set("n", "<leader>9", ":LualineBuffersJump! 9<cr>")

-- Diagnostic keymaps
keymap.set('n', '[d', vim.diagnostic.goto_prev)
keymap.set('n', ']d', vim.diagnostic.goto_next)
keymap.set('n', '<leader>e', vim.diagnostic.open_float)
keymap.set('n', '<leader>d', vim.diagnostic.setloclist)

-- telescope
keymap.set("", "<C-p>", require("telescope.builtin").find_files)
keymap.set("n", "<leader>fo", require("telescope.builtin").oldfiles)
keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep)
keymap.set("n", "<leader>fd", require("telescope.builtin").diagnostics)
