return {
	"supermaven-inc/supermaven-nvim",
	-- event = "VeryLazy",
	config = function()
		require("supermaven-nvim").setup({
			keymaps = {
				accept_suggestion = "<C-e>",
				accept_word = "<C-Space>",
			},
			color = {
				suggestion_color = vim.api.nvim_get_hl(0, { name = "NonText" }).fg,
				cterm = vim.api.nvim_get_hl(0, { name = "NonText" }).cterm,
				suggestion_group = "NonText",
			},
		})
	end,
}
