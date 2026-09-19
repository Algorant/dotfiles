return {
	"stevearc/conform.nvim",
	opts = {},

	config = function()
		require("conform").setup({
			formatters_by_ft = {
				-- Lua
				lua = { "stylua" },

				-- Python
				python = function(bufnr)
					if require("conform").get_formatter_info("ruff_format", bufnr).available then
						return { "ruff_format" }
					else
						return { "isort", "black" }
					end
				end,

				-- Rust
				rust = { "rustfmt", lsp_format = "fallback" },
			},
			-- Format on save
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 500,
			},
		})
	end,
}
