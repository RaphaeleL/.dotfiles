local menu = require("which-key")

menu.setup({
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
})

menu.register({
  ["<leader>r"] = { ":redo<cr>", "Redo" },
  ["<leader>u"] = { ":undo<cr>", "Undo" },
  ["<leader>U"] = { ":UndotreeToggle<cr>", "Undotree" },
  ["<leader>e"] = { ":NvimTreeToggle<cr>", "Explorer" },
  ["<leader>s"] = { ":Telescope find_files<cr>", "Filesystem" },
  ["<leader>n"] = { ":noh<cr>", "No Highlighting" },
  ["<leader>c"] = { ":bdelete<cr>", "Close Tab" },
  ["<leader>;"] = { ":Alpha<cr>", "Dashboard" },
  ["<leader>k"] = { ":CommentToggle<cr>", "Comment Line Toggle" },
  ["<leader>h"] = { ":lua require('telescope.builtin').help_tags()<cr>", "Help" },
})

menu.register({
  ["<Leader>"] = {
    f = {
      name = "+File",
      g = {":lua require('telescope.builtin').grep_string({ search = vim.fn.input(\"Grep For > \")})<cr>", "Grep Word"},
      b = {":lua require('telescope.builtin').buffers()<cr>", "Show Buffers"},
      w = {":Autoformat<cr>", "Format File"},
      l = {":AutoformatLine<cr>", "Format Line"},
      f = {":RemoveTrailingSpaces<cr>", "Remove Trailing Spaces"},
    }
  }
})

menu.register({
  ["<Leader>"] = {
    d = {
      name = "+Diagnostics",
      --d = {":TroubleToggle<cr>", "Show Diagnostics Menu"},
      D = {":lua vim.lsp.buf.definition()<cr>", "Show Definition"},
      i = {":lua vim.lsp.buf.implementation()<cr>", "Show Implementation"},
      r = {":lua vim.lsp.buf.rename()<cr>", "Rename"},
      I = {":lua vim.lsp.buf.hover()<cr>", "Show Informations"},
      n = {":lua vim.lsp.diagnostic.goto_next()<cr>", "Show next Diagnostic"},
      N = {":lua vim.lsp.diagnostic.goto_prev()<cr>", "Show previous Diagnostic"},
      l = {":lua vim.lsp.diagnostic.show_line_diagnostics()<cr>", "Show Line Diagnostic"},
      p = {":lua vim.lsp.diagnostic.show_position_diagnostics()<cr>", "Show Position Diagnostic"},
    }
  }
})

menu.register({
  ["<Leader>"] = {
    t = {
      name = "+Terminal",
      t = {":ToggleTerm direction=float<cr>", "Floating Terminal"},
      b = {":ToggleTerm<cr>", "Terminal on the bottom"},
    }
  }
})

menu.register({
  ["<Leader>"] = {
    a = {
      name = "+Lines",
      b = {":call append(line('.'), '')<cr>", "Add Line Below"},
      a = {":call append(line('.')-1, '')<cr>", "Add Line Above"},
    }
  }
})

menu.register({
  ["<Leader>"] = {
    g = {
      name = "+Git",
      g = {":Copilot panel<cr>", "Github Copilot Suggestions"},
      l = {":Gitsigns toggle_signs<cr>", "Toggle Git Changes Sign"},
      s = {":Telescope git_status<cr>", "Git Status"},
      c = {":Telescope git_commits<cr>", "Git Commits"},
      b = {":Telescope git_branches<cr>", "Git Branches"},
    }
  }
})