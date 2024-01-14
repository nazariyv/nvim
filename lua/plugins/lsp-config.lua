return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()

			-- install these (mason-lspconfig does not allow to install anything
			-- other than the lsp). so we need this script to help us out
			local ensure_installed = {
				"shellcheck",
				"black",
			}
			vim.api.nvim_create_user_command("MasonInstallAll", function()
				if ensure_installed and #ensure_installed > 0 then
					vim.cmd("MasonInstall " .. table.concat(ensure_installed, " "))
				end
			end, {})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"tsserver",
					"rust_analyzer",
					"html",
					"cssls",
					"clangd",
					"ruff_lsp",
					"pyright",
					"graphql",
					"bashls",
					"jsonls",
					"solidity_ls_nomicfoundation",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.tsserver.setup({ capabilities = capabilities })
			lspconfig.ruff_lsp.setup({ capabilities = capabilities })
			lspconfig.pyright.setup({ capabilities = capabilities })
		end,
	},
}
