local opt = vim.opt
local g = vim.g
local config = require("core.utils").load_config()

vim.g.mapleader = " "


vim.g.nvchad_theme = config.ui.theme
vim.g.toggle_theme_icon = "   "
vim.g.transparency = config.ui.transparency
vim.g.theme_switcher_loaded = false

vim.g.vim_version = vim.version().minor

-- use filetype.lua instead of filetype.vim
vim.g.did_load_filetypes = 0
vim.g.do_filetype_lua = 1

vim.opt.laststatus = 3 -- global statusline
vim.opt.statusline = config.ui.statusline.config
vim.opt.showmode = false
vim.opt.wrap = true
vim.opt.errorbells = false               -- Disable any error bells
vim.opt.hidden = true                     -- Allow changing buffers even with modifications
vim.opt.spell = false                      -- Enable spell check
vim.opt.spellcapcheck = ''             -- Disable capitalization spell check
vim.opt.title = true                      -- Modify the terminal title
vim.opt.hlsearch = true                   -- Highlight search results
vim.opt.incsearch = true                  -- Jump to the first match in real-time
vim.opt.ignorecase = true                 -- Case insensitive search, by default.
vim.opt.smartcase = true                  -- Case-sensitive if there any capital letters


vim.opt.title = true
vim.opt.clipboard = "unnamedplus"
vim.opt.cul = true -- cursor line

-- Indenting
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true

vim.opt.fillchars = { eob = " " }
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = "a"

-- Numbers
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.ruler = false

-- disable nvim intro
vim.opt.shortmess:append "sI"

vim.opt.signcolumn = "yes"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 8
vim.opt.termguicolors = true
vim.opt.timeoutlen = 400
vim.opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
vim.opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
vim.opt.whichwrap:append "<>[]hl"

vim.opt.sessionoptions = vim.opt.sessionoptions
              - "blank"        -- Don't save empty windows in the session
              - "buffers"      -- Don't save hidden buffers into the session
              - "help"         -- Ignore the help buffer for sessions
              - "options"      -- Don't save any vim options (this list)
              - "globals"      -- Ignore any g:-variables
              + "localoptions" -- Include buffer local overrides
              + "tabpages"     -- This session is for all tabs, not individual ones

vim.opt.formatoptions = vim.opt.formatoptions
                 + "r"         -- Add comment syntax to new lines in insert mode
                 + "o"         -- Automatically add comment syntax after o/O

vim.opt.history = 10000

-- disable some builtin vim plugins
local default_plugins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
   "python3_provider",
   "python_provider",
   "node_provider",
   "ruby_provider",
   "perl_provider",
   "tutor",
   "rplugin",
   "syntax",
   "synmenu",
   "optwin",
   "compiler",
   "bugreport",
   "ftplugin",
}

for _, plugin in pairs(default_plugins) do
   vim.g["loaded_" .. plugin] = 1
end

-- set shada path
vim.schedule(function()
   vim.opt.shadafile = vim.fn.expand "$HOME" .. "/.local/share/nvim/shada/main.shada"
   vim.cmd [[ silent! rsh ]]
end)

-- load user options
config.options.user()
