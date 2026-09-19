return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		config = function()
			-- 	local wk = require("which-key")
			-- 	wk.add({
			-- 		{ "<leader>pm", "<cmd>Mason<CR>", desc = "Mason" },
			-- 	})
			require("mason").setup({
				ui = {
					border = "rounded",
				},
			})
		end,
	},
	{
		"Senal-D-A-Gunaratna/swapson.nvim",
		lazy = false,
		dependencies = {
			"williamboman/mason.nvim",
		},
		opts = {
			npm = {
				enabled = true,
				tool = "bun",
				patch_version_lookup = true,
			},
			-- Mason's Python manager remains unchanged. This plugin does not
			-- replace it unless uv is explicitly enabled here.
			pip = {
				enabled = false,
			},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function()
			local servers = {
				-- "lua_ls", -- Use pacman for this one due to build issues
				"ruff",
				"basedpyright",
				"bashls",
				"yamlls",
				"jsonls",
				"cssls",
				"html",
			}
			require("mason-lspconfig").setup({
				ensure_installed = servers,
			})
		end,
	},
}
