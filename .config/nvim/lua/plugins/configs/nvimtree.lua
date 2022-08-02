local present, nvimtree = pcall(require, "nvim-tree")

if not present then
   return
end

require("base46").load_highlight "nvimtree"

local options = {
  auto_reload_on_write = true,
  create_in_closed_folder = false,
  reload_on_bufenter = false,
  filters = {
     dotfiles = false,
     exclude = { vim.fn.stdpath "config" .. "/lua/custom" },
  },
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = not vim.g.started_by_firenvim,
  open_on_tab = not vim.g.started_by_firenvim,
  ignore_ft_on_setup = { "alpha" },
  hijack_cursor = true,
  hijack_unnamed_buffer_when_opening = false,
  update_cwd = true,
  update_focused_file = {
     enable = true,
     update_cwd = false,
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  view = {
     side = "left",
     width = 25,
     hide_root_folder = true,
  },
  git = {
     enable = false,
     ignore = true,
  },
  actions = {
     open_file = {
        resize_window = true,
     },
  },
  renderer = {
     highlight_git = false,
     highlight_opened_files = "none",

     indent_markers = {
        enable = false,
     },

     icons = {
        show = {
           file = true,
           folder = true,
           folder_arrow = true,
           git = false,
        },

        glyphs = {
           default = "",
           symlink = "",
           folder = {
              default = "",
              empty = "",
              empty_open = "",
              open = "",
              symlink = "",
              symlink_open = "",
              arrow_open = "",
              arrow_closed = "",
           },
           git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
           },
        },
     },
  },
}

-- check for any override
options = require("core.utils").load_override(options, "kyazdani42/nvim-tree.lua")

nvimtree.setup(options)
