local on_attach = function(_, bufnr)
	local opts = { buffer = bufnr }
	local nmap = function(keys, func)
		vim.keymap.set("n", keys, func, opts)
	end

	nmap("<leader>rn", vim.lsp.buf.rename)
	nmap("<leader>ca", vim.lsp.buf.code_action)
	nmap("<leader>cf", vim.lsp.buf.format)

	nmap("gd", vim.lsp.buf.definition)
	nmap("gr", require("telescope.builtin").lsp_references)
	nmap("gI", vim.lsp.buf.implementation)
	nmap("<leader>D", vim.lsp.buf.type_definition)
	nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols)
	nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols)

	nmap("K", vim.lsp.buf.hover)
	vim.keymap.set("i", "<C-i>", vim.lsp.buf.signature_help, opts)

	nmap("gD", vim.lsp.buf.declaration)
	nmap("<leader>wa", vim.lsp.buf.add_workspace_folder)
	nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder)
	nmap("<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end)
end

local servers = {
	rust_analyzer = {},
	tsserver = {},
	html = { filetypes = { "html", "twig", "hbs" } },
	eslint = {},
	tailwindcss = {},

	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
}

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			{
				"williamboman/mason-lspconfig.nvim",
				config = function()
					--  This function gets run when an LSP connects to a particular buffer.
					-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
					local capabilities = vim.lsp.protocol.make_client_capabilities()
					capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

					-- Ensure the servers above are installed
					local mason_lspconfig = require("mason-lspconfig")

					mason_lspconfig.setup({
						ensure_installed = vim.tbl_keys(servers),
					})

					mason_lspconfig.setup_handlers({
						function(server_name)
							require("lspconfig")[server_name].setup({
								capabilities = capabilities,
								on_attach = on_attach,
								settings = servers[server_name],
								filetypes = (servers[server_name] or {}).filetypes,
							})
						end,
					})
				end,
			},
		},
	},
}
