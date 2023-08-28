return {
  {
    "tpope/vim-fugitive",
    init = function()
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
      vim.keymap.set("n", "<leader>gp", ":Git push<cr>")
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '[p', require('gitsigns').prev_hunk,
          { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
        vim.keymap.set('n', ']p', require('gitsigns').next_hunk,
          { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
        vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk,
          { buffer = bufnr, desc = '[P]review [H]unk' })
      end,
    },
  },
  "tpope/vim-unimpaired",
  "tpope/vim-surround",
  { 'numToStr/Comment.nvim', opts = {} },
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "windwp/nvim-autopairs",
    -- Optional dependency
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require("nvim-autopairs").setup {}
      -- If you want to automatically add `(` after selecting a function or method
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      telescope.setup({
        defaults = {
          file_ignore_patterns = { "node_modules", ".git", ".target" },
          mappings = {
            i = {
              ["<esc>"] = actions.close,
            },
          },
        },
      })
      telescope.load_extension('fzf')
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      disable_netrw = true,
      hijack_netrw = true,
      update_cwd = false,
      update_focused_file = {
        enable = true,
        update_cwd = false,
      },
      view = {
        adaptive_size = false,
        side = "right",
        width = 25,
      },
    },
    init = function()
      vim.keymap.set("n", "<C-n>", "<cmd> NvimTreeToggle <CR>")
      vim.keymap.set("i", "<C-n>", "<cmd> NvimTreeToggle <CR>")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    init = function()
      local lualine = require("lualine")
      lualine.setup({
        options = {
          icons_enabled = false,
          section_separators = { left = "", right = "" },
          disabled_filetypes = {},
        },
        sections = {
          lualine_a = {
            {
              "buffers",
              show_filename_only = true,
              mode = 2,
              symbols = {
                modified = " ●", -- Text to show when the buffer is modified
                alternate_file = "", -- Text to show to identify the alternate file
                directory = "", -- Text to show when the buffer is a directory
              },
            },
          },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {
            {
              "diagnostics",
              sources = { "nvim_diagnostic" },
              symbols = {
                error = " ",
                warn = " ",
                info = " ",
                hint = " "
              },
            },
          },
          lualine_y = {},
          lualine_z = { "progress" },
        },
      })
    end,
  },
}
