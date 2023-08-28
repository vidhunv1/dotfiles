return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        color_overrides = {
          mocha = {
            base = "#000000",
            mantle = "#000000",
            crust = "#000000",
          },
        },
        custom_highlights = function(colors)
          return {
            Cursor = { bg = colors.text },
            Cursor2 = { bg = colors.text },
            CursorLineNr = { fg = colors.mauve, style = { "bold" } },
            CursorLine = { bg = colors.surface0 },
          }
        end,
      })
      vim.cmd.colorscheme 'catppuccin-latte'
    end
  },
  "Mofiqul/vscode.nvim",
}
