--lua/plugins/mini.lua

return {
	{
		"echasnovski/mini.nvim",
		config = function()
			-- local statusline = require 'mini.statusline'
			-- statusline.setup { use_icons = true }
		end,
	},
	{
		"echasnovski/mini.indentscope",
		version = false,
		config = function()
			require("mini.indentscope").setup(
				-- Set the indent color
				vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#928374" })
			)
		end,
	},
	{
		"echasnovski/mini.files",
		version = false,
		config = function()
			require("mini.files").setup()

			local wk = require("which-key")
			local icons = require("config.icons")
			-- Add shortcut
			wk.add({
				{
					"<leader>e",
					function()
						require("mini.files").open()
					end,
					desc = "File Explorer",
					icon = { icon = icons.ui.FolderOpen, color = "blue" },
				},
			})
		end,
	},
	{
		"echasnovski/mini.bracketed",
		version = false,
		config = function()
			require("mini.bracketed").setup()
		end,
	},
	{
		"echasnovski/mini.ai",
		version = false,
		config = function()
			require("mini.ai").setup()
		end,
	},
	{
		"echasnovski/mini.surround",
		version = false,
		config = function()
			require("mini.surround").setup()
		end,
	},
	{
		"echasnovski/mini.pairs",
		version = false,
		config = function()
			require("mini.pairs").setup()
		end,
	},
}
