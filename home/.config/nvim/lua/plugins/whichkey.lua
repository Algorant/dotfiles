return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "modern",
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},

	config = function()
		local icons = require("config.icons")
		local wk = require("which-key")
		wk.add({
			-- Individual Keys
			{ "<leader>w", ":w<CR>", desc = "Save File", icon = { icon = icons.ui.Save, color = "blue" } },
			{
				"<leader>Q",
				":x<CR>",
				desc = "Save & Quit",
				icon = { icon = icons.ui.BoldClose, color = "blue" },
			},
			{ "<leader>x", ":bdelete<CR>", desc = "Close Buffer", icon = { icon = icons.ui.Close, color = "blue" } },
			{ "<leader>v", "<cmd>vsplit<CR>", desc = "Split Buffer", icon = { icon = icons.ui.Close, color = "blue" } },
			{
				"<leader>/",
				"gcc",
				desc = "Toggle Comment",
				icon = { icon = icons.ui.Code, color = "blue" },
				remap = true,
				mode = "n",
			},
			{
				"<leader>/",
				"gc<Esc>",
				desc = "Toggle Comment",
				icon = { icon = icons.ui.Code, color = "blue" },
				remap = true,
				mode = "v",
			},
			{
				"<leader>z",
				"<cmd>nohlsearch<CR>",
				icon = { icon = icons.ui.Code, color = "blue" },
				desc = "Remove Search Highlight",
			},
			-- Extensions in Groups
			{
				"<leader>L",
				":Lazy<CR>",
				desc = "Lazy",
				icon = { icon = icons.misc.Lazy, color = "cyan" },
			},
			{
				"<leader>M",
				":Mason<CR>",
				desc = "Mason",
				icon = { icon = icons.misc.Hammer, color = "cyan" },
			},
			-- LSP Actions
			{
				"<leader>ld",
				"<cmd>lua vim.lsp.buf.definition()<CR>",
				desc = "Go to Definition",
				icon = { icon = icons.ui.Forward, color = "blue" },
			},
			{
				"<leader>lD",
				"<cmd>lua vim.lsp.buf.declaration()<CR>",
				desc = "Go to Declaration",
				icon = { icon = icons.ui.Forward, color = "blue" },
			},
			{
				"<leader>lr",
				"<cmd>lua vim.lsp.buf.references()<CR>",
				desc = "Find References",
				icon = { icon = icons.ui.References, color = "blue" },
			},
			{
				"<leader>li",
				"<cmd>lua vim.lsp.buf.implementation()<CR>",
				desc = "Go to Implementation",
				icon = { icon = icons.ui.Forward, color = "blue" },
			},
			{
				"<leader>lt",
				"<cmd>lua vim.lsp.buf.type_definition()<CR>",
				desc = "Type Definition",
				icon = { icon = icons.ui.Type, color = "blue" },
			},
			{
				"<leader>lh",
				"<cmd>lua vim.lsp.buf.hover()<CR>",
				desc = "Hover Documentation",
				icon = { icon = icons.ui.Question, color = "blue" },
			},
			{
				"<leader>ls",
				"<cmd>lua vim.lsp.buf.signature_help()<CR>",
				desc = "Signature Help",
				icon = { icon = icons.ui.Signature, color = "blue" },
			},
			{
				"<leader>ln",
				"<cmd>lua vim.lsp.buf.rename()<CR>",
				desc = "Rename Symbol",
				icon = { icon = icons.ui.Pencil, color = "blue" },
			},
			{
				"<leader>la",
				"<cmd>lua vim.lsp.buf.code_action()<CR>",
				desc = "Code Action",
				icon = { icon = icons.ui.LightBulb, color = "yellow" },
			},
			{
				"<leader>lf",
				"<cmd>lua vim.lsp.buf.format({ async = true })<CR>",
				desc = "Format Document",
				icon = { icon = icons.ui.Gear, color = "blue" },
			},

			-- Diagnostics
			{
				"<leader>lt",
				"<cmd>lua require('plugins.lsp').toggle_diagnostics()<CR>",
				desc = "Toggle Diagnostics",
				icon = { icon = icons.ui.Toggle, color = "blue" },
			},
			{
				"<leader>lx",
				"<cmd>lua vim.diagnostic.open_float()<CR>",
				desc = "Line Diagnostics",
				icon = { icon = icons.diagnostics.Error, color = "red" },
			},

			{
				"<leader>lj",
				"<cmd>lua vim.diagnostic.goto_next()<CR>",
				desc = "Next Diagnostic",
				icon = { icon = icons.ui.ChevronDown, color = "blue" },
			},
			{
				"<leader>lk",
				"<cmd>lua vim.diagnostic.goto_prev()<CR>",
				desc = "Previous Diagnostic",
				icon = { icon = icons.ui.ChevronUp, color = "blue" },
			},
			{
				"<leader>lq",
				"<cmd>lua vim.diagnostic.setloclist()<CR>",
				desc = "Diagnostics List",
				icon = { icon = icons.ui.List, color = "blue" },
			},
			{
				"<leader>ll",
				"<cmd>lua vim.diagnostic.disable()<CR>",
				desc = "Disable Diagnostics",
				icon = { icon = icons.ui.Close, color = "red" },
			},
			{
				"<leader>lL",
				"<cmd>lua vim.diagnostic.enable()<CR>",
				desc = "Enable Diagnostics",
				icon = { icon = icons.ui.Check, color = "green" },
			},
			--Groups
			{ "<leader>f", group = "Find", icon = { icon = icons.ui.Telescope, color = "green" } },
			{ "<leader>l", group = "LSP", icon = { icon = icons.diagnostics.Debug, color = "green" } },
			{ "<leader>p", group = "Plugins", icon = { icon = icons.ui.Package, color = "green" } },
			{ "<leader>a", group = "Avante", icon = { icon = icons.misc.Robot, color = "green" } },
			-- { "<leader>h", group = "Harpoon", icon = { icon = icons.misc.Harpoon, color = "green" } },
		})
	end,
}
