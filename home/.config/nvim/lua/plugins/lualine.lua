return {
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					theme = require("verdigris.lualine"),
					globalstatus = true,
					disabled_filetypes = { winbar = { "avante", "snacks" } },
					winbar = nil,
				},
			})
		end,
	},
}
