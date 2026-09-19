return {
	{
		"Algorant/verdigris.nvim",
		name = "verdigris",
		lazy = false,
		priority = 1000,
		config = function()
			require("verdigris").setup({
				transparent = true,
				italics = {
					comments = true,
					keywords = true,
				},
				bold = {
					functions = true,
					types = true,
				},
			})
			vim.cmd.colorscheme("verdigris")
		end,
	},

	-- Previous schemes kept disabled for easy fallback while verdigris is developed.
	{ "Koalhack/darcubox-nvim", enabled = false },
	{ "luisiacc/gruvbox-baby", enabled = false },
	{ "sainnhe/gruvbox-material", enabled = false },
	{ "ellisonleao/gruvbox.nvim", enabled = false },
}
