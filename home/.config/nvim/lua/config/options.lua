-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Backup and swap
vim.opt.backup = false -- Disables creation of backup files
vim.opt.swapfile = false -- Disables creation of swapfile
vim.opt.writebackup = false -- Prevents file editing if it's being edited elsewhere

-- Indentation
vim.opt.expandtab = true -- Converts tabs to spaces
vim.opt.shiftwidth = 2 -- Number of spaces for each indentation
vim.opt.tabstop = 2 -- Number of spaces for a tab
vim.opt.smartindent = true -- Makes indenting smarter

-- Encoding
vim.opt.fileencoding = "utf-8" -- Sets the encoding written to a file

-- Command line
vim.opt.cmdheight = 1 -- More space for displaying messages
vim.opt.showmode = false -- Hides the mode display (e.g., -- INSERT --)

-- UI Elements
vim.opt.cursorline = true -- Highlights the current line
vim.opt.number = true -- Shows line numbers
vim.opt.relativenumber = true -- Disables relative line numbers
vim.opt.numberwidth = 2 -- Sets width of number column
vim.opt.signcolumn = "yes" -- Always shows the sign column
vim.opt.wrap = false -- Disables line wrap
vim.opt.scrolloff = 8 -- Minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 8 -- Minimal number of screen columns to keep to the left and right of the cursor
vim.opt.laststatus = 3 -- Always display the status line
vim.opt.ruler = false -- Hides the line and column number of the cursor position
vim.opt.title = false -- Disables the window's title
vim.opt.guifont = "monospace:h17" -- Sets the font used in graphical Neovim applications
vim.opt.fillchars = { eob = " " } -- Removes ~~~ for eof/eob
vim.api.nvim_set_hl(0, "WinBar", { bg = "NONE" }) -- Removes the window bar background
vim.api.nvim_set_hl(0, "WinBarNC", { bg = "NONE" })

-- Undo
vim.opt.undofile = true -- Enables persistent undo

-- Visual
vim.opt.termguicolors = true -- Enables 24-bit RGB color in the TUI

-- Tabs
vim.opt.showtabline = 1 -- Always show tabs

-- Commenting
vim.opt.formatoptions:remove({ "c", "r", "o" }) -- Disable commenting

-- Add Filetypes for config files
vim.filetype.add({
	extension = { rasi = "rasi" },
	pattern = {

		[".*/hypr.*%.conf"] = "hyprlang",
	},
})

-- Commentstring for Hyprland
vim.bo.commentstring = "# %s"

-- Vim Parsers (for :checkhealth to ignore warnings)
vim.g.loaded_perl_provider = 0 -- Disables Perl provider
vim.g.loaded_python_provider = 0 -- Disables Python 2 provider
vim.g.loaded_ruby_provider = 0 -- Disables Ruby provider
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
-- Reduce delay for CursorHold events (e.g., LSP diagnostics float)
vim.opt.updatetime = 250

-- Window borders
vim.opt.winborder = "rounded"
