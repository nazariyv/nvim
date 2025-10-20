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
					"rust_analyzer",
					"ts_ls",
					"html",
					"cssls",
					-- "clangd",
					"ruff",
					"svelte",
					"pyright",
					"graphql",
					"bashls",
					"jsonls",
					"solidity_ls_nomicfoundation",
					"dockerls",
					"docker_compose_language_service",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- NOTE: ensure you are on neovim 0.11+ for this to work
			-- else, use the commented bit down below
			-- Neovim 0.11+ style
			-- You can keep nvim-lspconfig installed, but use the native API below.
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config("lua_ls", { capabilities = capabilities })
			vim.lsp.config("ts_ls", { capabilities = capabilities }) -- was tsserver
			vim.lsp.config("ruff", { capabilities = capabilities }) -- was ruff_lsp
			vim.lsp.config("pyright", {
				capabilities = capabilities,
				settings = {
					python = {
						analysis = {
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
							diagnosticMode = "workspace",
						},
					},
				},
			})
			vim.lsp.config("svelte", { capabilities = capabilities })
			vim.lsp.config("rust_analyzer", {
				capabilities = capabilities,
				cmd = { "rustup", "run", "stable", "rust-analyzer" },
				settings = {
					["rust-analyzer"] = {
						cargo = { allFeatures = true },
						check = { command = "clippy" },
					},
				},
			})

			-- Enable them (activates per their filetypes)
			vim.lsp.enable({ "lua_ls", "ts_ls", "ruff", "pyright", "svelte", "rust_analyzer" })

			-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
			--
			-- local lspconfig = require("lspconfig")
			-- lspconfig.lua_ls.setup({ capabilities = capabilities })
			-- lspconfig.ts_ls.setup({ capabilities = capabilities })
			--
			-- -- -- helps you debug what sets up duplicate servers
			-- -- local orig = lspconfig.ts_ls.setup
			-- -- lspconfig.ts_ls.setup = function(opts)
			-- --   vim.schedule(function()
			-- --     vim.notify("ts_ls.setup called from:\n" .. debug.traceback("", 2), vim.log.levels.WARN)
			-- --   end)
			-- --   return orig(opts)
			-- -- end
			--
			-- lspconfig.ruff.setup({ capabilities = capabilities })
			-- lspconfig.pyright.setup({
			--   capabilities = capabilities,
			--   settings = {
			--     python = {
			--       analysis = {
			--         autoSearchPaths = true,
			--         useLibraryCodeForTypes = true,
			--         diagnosticMode = "workspace",
			--       },
			--     },
			--   },
			-- })
			-- lspconfig.svelte.setup({ capabilities = capabilities })
		end,
	},
}
