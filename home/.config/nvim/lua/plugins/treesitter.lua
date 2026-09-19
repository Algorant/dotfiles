return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      local ok, ts = pcall(require, "nvim-treesitter")
      if not ok then
        return
      end

      local wanted = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "markdown_inline",
        "python",
        "rust",
        "json",
        "jsonc",
        "yaml",
        "html",
        "css",
        "bash",
        "toml",
        "gitignore",
        "dockerfile",
        "regex",
      }

      local installed = {}
      for _, lang in ipairs(ts.get_installed()) do
        installed[lang] = true
      end

      local missing = {}
      for _, lang in ipairs(wanted) do
        if not installed[lang] then
          table.insert(missing, lang)
        end
      end

      if #missing > 0 and vim.fn.executable("tree-sitter") == 1 then
        vim.schedule(function()
          ts.install(missing, { summary = true })
        end)
      end

      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end,
  }
}
