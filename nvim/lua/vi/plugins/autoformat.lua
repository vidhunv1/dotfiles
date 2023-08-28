return {
	{
		"jose-elias-alvarez/null-ls.nvim",
		init = function()
			local null_ls = require("null-ls")
			local formatting = null_ls.builtins.formatting

			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			-- NOTE: install formatters
			-- cargo install stylua
			-- npm i -g eslint_d @fsouza/prettierd
			null_ls.setup({
				sources = {
					formatting.stylua,
					formatting.prettierd,
					formatting.eslint_d,
				},

				-- format on save
				on_attach = function(current_client, bufnr)
					if current_client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({
									filter = function(client)
										--  only use null-ls for formatting instead of lsp server
										return client.name == "null-ls"
									end,
									bufnr = bufnr,
								})
							end,
						})
					end
				end,
			})
		end,
	},
	{ "jayp0521/mason-null-ls.nvim" },
}
