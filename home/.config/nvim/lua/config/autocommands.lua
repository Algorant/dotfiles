-- Disable auto-commenting on new lines
vim.api.nvim_create_autocmd("BufEnter", {
  desc = "Disable auto-commenting",
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text" },
  desc = "Enable wrapping for prose files",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.breakindent = true
  end,
})
