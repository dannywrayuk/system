-- Options

-- Leader
vim.g.mapleader = " "

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- CHONKY BOI
vim.opt.guicursor = ""

-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Floating window borders
vim.opt.winborder = "single"

-- Tabs
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Search highlight
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Add buffer to top and bottom scroll
vim.opt.scrolloff = 8

-- Dont show the default mode thing
vim.opt.showmode = false

-- Dont show the default ruler
vim.opt.ruler = false

-- Highlight current line
vim.opt.cursorline = true

-- No swapfile or backup
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.isfname:append("@-@")
vim.opt.signcolumn = "no"
vim.opt.updatetime = 50

-- Always split to the right
vim.opt.splitright = true

-- Dont add comment on newlines
vim.cmd([[autocmd BufEnter * set formatoptions-=cro]])

-- set diagnostic symbols
vim.diagnostic.config({
  virtual_text = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "󰌵",
    },
  },
})

-- Enable new UI features
require("vim._core.ui2").enable()

-- Keymaps
-- Add default options to keymaps
local ks = vim.keymap.set
---@diagnostic disable-next-line: duplicate-set-field
vim.keymap.set = function(mode, key, action, opts)
  if type(opts) == "table" then
    opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts)
  else
    opts = { noremap = true, silent = true }
  end
  return ks(mode, key, action, opts)
end

-- Remap for uk keyboard lol
vim.keymap.set("i", "£", "#")

-- Why is this key even a thing
vim.keymap.set({ "n", "v", "i", "t" }, "§", "<Esc>")

-- Moving lines
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Duplicate lines
vim.keymap.set("n", "<A-J>", ":t .<CR>")
vim.keymap.set("n", "<A-K>", ":t .-1<CR>")
vim.keymap.set("i", "<A-J>", "<Esc>:t .-1<CR>==gi")
vim.keymap.set("i", "<A-K>", "<Esc>:t .<CR>==gi")
vim.keymap.set("v", "<A-J>", ":t '<-1<CR>gv=gv")
vim.keymap.set("v", "<A-K>", ":t '><CR>gv=gv")

-- Comment toggle
vim.keymap.set("n", "<leader>?", ":Commentary<CR>")
vim.keymap.set("v", "<leader>?", ":Commentary<CR> gv")

-- Center while moving
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Word wrapping
vim.opt.wrap = true
vim.keymap.set("n", "<leader>w", function()
  ---@diagnostic disable-next-line: undefined-field
  vim.opt.wrap = not vim.opt.wrap:get()
end, { desc = "Toggle word wrap" })

-- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<A-y>", [["+y]])

-- Paste last yanked
vim.keymap.set({ "n" }, "<A-p>", [["0p]])

-- Go to definition
vim.keymap.set("n", "<leader><leader>", function()
  vim.lsp.buf.definition()
end, { desc = "Go to definition of current word" })

local languageLogs = {
  javascript = "console.log()",
  javascriptreact = "console.log()",
  typescript = "console.log()",
  typescriptreact = "console.log()",
  lua = "print()",
}
vim.keymap.set({ "n", "i" }, "<A-l>", function()
  local log = languageLogs[vim.o.filetype]
  if log then
    vim.cmd(":norm a" .. log)
    vim.cmd(":startinsert")
  else
    print("no log format for: " .. vim.o.filetype)
  end
end, { desc = "Add log statement at cursor" })

-- Utilities
local gh = function(x)
  return "https://github.com/" .. x
end

local readFile = function(path)
  local f = assert(io.open(path, "rb"))
  local content = f:read("*all")
  f:close()
  return content
end

local toRGB = function(col)
  col = string.lower(col)
  return { tonumber(col:sub(2, 3), 16), tonumber(col:sub(4, 5), 16), tonumber(col:sub(6, 7), 16) }
end

local blend = function(foreground, background, alpha)
  alpha = type(alpha) == "string" and (tonumber(alpha, 16) / 0xff) or alpha
  local bg = toRGB(background)
  local fg = toRGB(foreground)

  local blendChannel = function(i)
    local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
    return math.floor(math.min(math.max(0, ret), 255) + 0.5)
  end

  return string.format("#%02x%02x%02x", blendChannel(1), blendChannel(2), blendChannel(3))
end

local breadcrumb = function(path)
  if path == nil or path == "" then
    return ""
  end
  return path:gsub("/", "  ")
end

local getRootDir = function(markers)
  return function(buf, on_dir)
    local bufferPath = vim.fs.dirname(vim.api.nvim_buf_get_name(buf))
    local matches = vim.fs.find(markers, {
      path = bufferPath,
      upward = true,
      limit = 1,
    })
    if #matches == 1 then
      return on_dir(vim.fn.fnamemodify(matches[1], ":p:h"))
    end
    on_dir(vim.fs.dirname(vim.fs.find(".git", { path = bufferPath, upward = true })[1]))
  end
end

-- Plugins
vim.pack.add({
  gh("neovim/nvim-lspconfig"),
  gh("nvim-lua/plenary.nvim"),
  gh("nvim-tree/nvim-web-devicons"),
  gh("tpope/vim-commentary"),
  gh("kamykn/spelunker.vim"),
})

vim.api.nvim_create_user_command("PackClear", function()
  vim.pack.del(vim.iter(vim.pack.get())
    :filter(function(x)
      return not x.active
    end)
    :map(function(x)
      return x.spec.name
    end)
    :totable())
end, { desc = "Clear inactive plugins" })

vim.api.nvim_create_user_command("PackSync", function()
  vim.pack.update(nil, { target = "lockfile" })
end, { desc = "Sync plugins with lockfile" })

-- Treesitter
vim.pack.add({ { src = gh("nvim-treesitter/nvim-treesitter"), branch = "main" } })
require("nvim-treesitter").install({
  "json",
  "javascript",
  "typescript",
  "tsx",
  "yaml",
  "html",
  "css",
  "prisma",
  "markdown",
  "markdown_inline",
  "svelte",
  "graphql",
  "bash",
  "dockerfile",
  "gitignore",
  "query",
  "swift",
  "go",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function(args)
    local buf = args.buf
    local ft = vim.bo[buf].filetype
    local lang = vim.treesitter.language.get_lang(ft)
    if not lang then
      return
    end

    pcall(vim.treesitter.language.add, lang)
    pcall(vim.treesitter.start, buf, lang)
  end,
})

-- Autotag
vim.pack.add({ gh("windwp/nvim-ts-autotag") })
require("nvim-ts-autotag").setup({})

-- Color scheme
vim.pack.add({
  { name = "catppuccin", src = gh("catppuccin/nvim") },
  gh("catgoose/nvim-colorizer.lua"),
})
require("colorizer").setup()

-- load custom palette colors from file, if it fails just use the default catppuccin colors
local _, palette = pcall(function()
  return vim.json.decode(readFile(vim.fn.expand("$HOME/.config/system/colors/palette.json")))
end)

require("catppuccin").setup({
  color_overrides = {
    all = palette,
  },
  custom_highlights = function(colors)
    return {
      BlinkCmpMenuBorder = { bg = colors.base, fg = colors.blue },
      BlinkCmpDocBorder = { bg = colors.base, fg = colors.peach },
      BlinkCmpDocSeparator = { fg = colors.surface0 },
      CopilotSuggestion = { fg = colors.yellow, bg = blend(colors.yellow, colors.base, 0.2) },
      Conditional = { link = "Keyword" },
      CursorLineNr = { fg = colors.peach },
      Delimiter = { fg = colors.blue },
      EndOfBuffer = { fg = colors.base },
      FloatBorder = { bg = colors.base, fg = colors.blue },
      FloatTitle = { bg = colors.base, fg = colors.peach },
      NeoTreeGitUntracked = { link = "NeoTreeGitAdded" },
      NormalFloat = { bg = colors.base },
      Number = { fg = colors.mauve },
      Operator = { fg = colors.blue },
      Pmenu = { bg = colors.base },
      SpelunkerComplexOrCompoundWord = { link = "SpelunkerSpellBad" },
      SpelunkerSpellBad = { underdouble = true },
      Type = { fg = colors.teal },
      WinSeparator = { fg = colors.blue },
      ["@constant.builtin"] = { fg = colors.pink },
      ["@function.builtin"] = { fg = colors.sapphire },
      ["@module"] = { fg = colors.peach },
      ["@parameter"] = { fg = colors.peach },
      ["@property"] = { fg = colors.maroon },
      ["@punctuation"] = { fg = colors.red },
      ["@punctuation.bracket"] = { fg = colors.red },
      ["@string.documentation"] = { fg = colors.blue },
      ["@tag"] = { fg = colors.teal },
      ["@tag.builtin"] = { fg = colors.blue },
      ["@tag.delimiter"] = { link = "Comment" },
      ["@type.builtin"] = { fg = colors.pink },
      ["@variable"] = { fg = colors.yellow },
      ["@variable.member"] = { fg = colors.maroon },
      ["@variable.parameter"] = { fg = colors.peach },
      SnacksDashboardDesc = { fg = "#ffca1e" },
      SnacksDashboardFile = { fg = "#ffca1e" },
      SnacksDashboardFooter = { fg = "#ffca1e" },
      SnacksDashboardHeader = { fg = "#ffca1e" },
      SnacksDashboardIcon = { fg = colors.peach },
      SnacksDashboardKey = { fg = colors.red },
      SnacksDashboardSpecial = { fg = colors.red },
      SnacksDashboardTitle = { fg = "#ffca1e" },
    }
  end,
})

local colors = require("catppuccin.palettes").get_palette("mocha")
vim.cmd([[colorscheme catppuccin]])

-- Snacks
vim.pack.add({ gh("folke/snacks.nvim") })
local Snacks = require("snacks")
Snacks.setup({
  dashboard = {
    enabled = true,
    formats = {
      file = function(item, ctx)
        local fname = vim.fn.fnamemodify(item.file, ":.")
        fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
        if #fname > ctx.width then
          local dir = vim.fn.fnamemodify(fname, ":h")
          local file = vim.fn.fnamemodify(fname, ":t")
          if dir and file then
            file = file:sub(-(ctx.width - #dir - 2))
            fname = dir .. "/…" .. file
          end
        end
        local dir, file = fname:match("^(.*)/(.+)$")
        return dir and { { dir .. "/", hl = "dir" }, { file, hl = "file" } } or { { fname, hl = "file" } }
      end,
    },
    sections = {
      { section = "header" },
      { section = "recent_files", padding = 2, cwd = true },
    },
    preset = {
      header = "neovim",
    },
  },
  gitbrowse = { enabled = true },
  indent = {
    enabled = true,
    animate = { enabled = false },
    hl = "Comment",
  },
  input = { enabled = true },
  picker = {
    enable = true,
    sources = {
      explorer = {
        exclude = { ".git", ".DS_Store" },
        hidden = true,
        layout = {
          hidden = { "input" },
        },
        auto_close = true,
        jump = {
          close = true,
        },
        win = {
          list = {
            keys = {
              ["L"] = "copy_loc",
            },
          },
        },
      },
      smart = {
        title = "Find Files",
        layout = {
          fullscreen = true,
        },
      },
      recent = {
        focus = "list",
        layout = {
          hidden = { "preview" },
        },
      },
      grep = {
        layout = {
          fullscreen = true,
        },
      },
      grep_word = {
        focus = "list",
        layout = {
          fullscreen = true,
        },
      },
      diagnostics_buffer = {
        focus = "list",
        layout = {
          preset = "select",
          hidden = { "preview", "input" },
        },
      },
      git_branches = {
        all = true,
        layout = {
          hidden = { "preview" },
        },
        win = {
          input = {
            keys = {
              ["<S-CR>"] = { "git_branch_add", mode = { "i" } },
            },
          },
        },
      },
      git_status = {
        focus = "list",
        layout = {
          fullscreen = true,
        },
        win = {
          list = {
            keys = {
              ["s"] = "git_stage",
              ["x"] = "git_restore",
            },
          },
          input = {
            keys = {
              ["s"] = "git_stage",
              ["x"] = "git_restore",
            },
          },
        },
      },
      lines = {
        layout = {
          fullscreen = true,
        },
      },
      spelling = {
        layout = {
          preset = "select",
          hidden = { "input", "preview" },
        },
      },
      select = {
        layout = {
          hidden = { "input", "preview" },
        },
      },
    },
    layout = {
      layout = {
        backdrop = false,
      },
    },
    actions = {
      explorer_up = function()
        vim.cmd("cd ..")
      end,
      explorer_focus = function(picker)
        vim.cmd("cd" .. picker:dir())
      end,
      copy_loc = function(_, item)
        local cwd = vim.fn.getcwd()
        local relative_path = vim.fs.relpath(cwd, item.file)
        vim.fn.setreg("+", relative_path)
        print("Copied path: " .. relative_path)
      end,
      git_restore = function(picker)
        local items = picker:selected({ fallback = true })
        if #items == 0 then
          return
        end
        Snacks.picker.util.confirm("Discard changes?", function()
          local done = 0
          for _, item in ipairs(items) do
            if not item.status or string.sub(item.status, 2, 2) == " " then
              Snacks.notify.error("Can't restore this change", { title = "Snacks Picker" })
            end
            Snacks.picker.util.cmd({ "git", "restore", item.file }, function()
              done = done + 1
              if done == #items then
                vim.schedule(function()
                  picker:refresh()
                  vim.cmd.checktime()
                end)
              end
            end, { cwd = item.cwd })
          end
        end)
      end,
    },
  },
  explorer = {
    enabled = true,
    replace_netrw = true,
  },
  quickfile = { enabled = true },
})

vim.keymap.set("n", "<leader>gb", function()
  Snacks.gitbrowse.open({ what = "file" })
end, { desc = "Open on git remote" })

vim.keymap.set("n", "<leader>t", Snacks.picker.explorer, { desc = "File explorer" })
vim.keymap.set("n", "<leader>ff", Snacks.picker.smart, { desc = "Find files" })
vim.keymap.set("n", "<leader>fr", Snacks.picker.recent, { desc = "Find recent files" })
vim.keymap.set("n", "<leader>fs", Snacks.picker.grep, { desc = "Find string" })
vim.keymap.set("n", "<leader>fw", Snacks.picker.grep_word, { desc = "Find word" })
vim.keymap.set("n", "<leader>fl", Snacks.picker.lines, { desc = "Find lines in buffer" })
vim.keymap.set("n", "<leader>fd", Snacks.picker.diagnostics_buffer, { desc = "List diagnostics in buffer" })
vim.keymap.set("n", "<leader>fg", Snacks.picker.git_branches, { desc = "Find git branches" })
vim.keymap.set("n", "<leader>z", Snacks.picker.git_status, { desc = "View git files" })
vim.keymap.set("n", "zs", Snacks.picker.spelling, { desc = "Spelling suggestions" })

vim.keymap.set("n", "<leader>fo", function()
  Snacks.picker.lines({
    focus = "list",
    matcher = {
      fuzzy = false,
    },
    layout = {
      hidden = { "input" },
    },
    on_show = function(picker)
      local current_line = vim.api.nvim_win_get_cursor(picker.main)[1]
      for i, item in ipairs(picker:items()) do
        if item.idx == current_line then
          picker.list:view(i)
          Snacks.picker.actions.list_scroll_center(picker)
          break
        end
      end
    end,
    pattern = function(picker)
      return picker:word()
    end,
  })
end, { desc = "Find word occurrences in buffer" })

vim.keymap.set("n", "<leader>fn", function()
  ---@diagnostic disable-next-line: param-type-mismatch
  local gitroot = vim.fn.fnamemodify(vim.fn.finddir(".git", ".;"), ":h")
  Snacks.picker({
    title = "Find Directory",
    finder = "proc",
    cmd = "fd",
    args = { "--type", "d", "--hidden", "--exclude", ".git", "--max-depth", "1" },
    cwd = gitroot,
    layout = {
      hidden = { "preview" },
    },
    transform = function(item)
      item.file = item.text
      item.dir = true
    end,
    confirm = function(picker, item)
      picker:close()
      Snacks.picker.explorer({
        cwd = vim.fs.joinpath(gitroot, item.file),
        follow_file = false,
      })
    end,
  })
end, { desc = "Find directory" })

-- Formatting
vim.pack.add({ gh("stevearc/conform.nvim") })
local Conform = require("conform")
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    Conform.format({
      lsp_fallback = true,
      async = false,
      timeout_ms = 1000,
    })
  end,
})

vim.api.nvim_create_user_command("W", function()
  vim.cmd("noautocmd write")
end, { desc = "Save without formatting" })

Conform.setup({
  formatters_by_ft = {
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    graphql = { "prettier" },
    lua = { "stylua" },
    go = { "gofmt" },
  },
})

-- Lualine
local separator = { left = "", right = "" }
local modeBar = function(mode_col)
  return {
    a = { fg = colors.mantle, bg = mode_col },
    c = { fg = colors.subtext2, bg = blend(mode_col, colors.base, 0.1) },
    y = { fg = colors.text, bg = blend(mode_col, colors.mantle, 0.2) },
    z = { fg = colors.text, bg = blend(mode_col, colors.mantle, 0.3) },
  }
end

local mode = {
  "mode",
  fmt = function(mode)
    local modeIcons = {
      NORMAL = "",
      INSERT = "",
      VISUAL = "󰈈",
      ["V-BLOCK"] = "",
      ["V-LINE"] = "",
      REPLACE = "",
      COMMAND = "",
      TERMINAL = "󱕷",
    }
    local icon = modeIcons[mode]
    if icon == nil then
      return mode:sub(1, 1)
    end
    return icon
  end,
  separator = separator,
}
vim.pack.add({ gh("nvim-lualine/lualine.nvim") })
require("lualine").setup({
  options = {
    theme = {
      normal = modeBar(colors.blue),
      insert = modeBar(colors.green),
      visual = modeBar(colors.yellow),
      replace = modeBar(colors.red),
      command = modeBar(colors.mauve),
      terminal = modeBar(colors.mauve),
      inactive = {
        a = { fg = colors.text, bg = colors.surface0 },
        b = { fg = colors.text, bg = "#00000000" },
      },
    },
    component_separators = "|",
    -- for some reason they are reversed here
    section_separators = { left = separator.right, right = separator.left },
    disabled_filetypes = { statusline = { "snacks_dashboard" } },
    globalstatus = true,
  },
  sections = {
    lualine_a = { mode },
    lualine_b = {},
    lualine_c = { { "filename", path = 1, fmt = breadcrumb } },
    lualine_x = {},
    lualine_y = { "diagnostics", "diff" },
    lualine_z = { { "filetype", separator = separator } },
  },
  inactive_sections = {},
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {
    {
      filetypes = { "snacks_picker_list" },
      sections = {
        lualine_a = { mode },
        lualine_c = {
          {
            function()
              return breadcrumb(vim.fn.fnamemodify(vim.fn.getcwd(), ":~"))
            end,
          },
        },
        lualine_z = { { "filetype", separator = separator } },
      },
    },
    {
      filetypes = { "TelescopePrompt", "snacks_input" },
      sections = {
        lualine_a = { mode },
        lualine_c = {},
        lualine_z = { { "filetype", separator = separator } },
      },
    },
  },
})

-- Copilot
vim.pack.add({ gh("github/copilot.vim") })

vim.keymap.set("i", "<A-c>c", "<Plug>(copilot-dismiss)")
vim.keymap.set("i", "<A-c>e", function()
  vim.cmd("Copilot enable")
end)
vim.keymap.set("i", "<A-c>d", function()
  vim.cmd("Copilot disable")
end)
vim.keymap.set("i", "<A-c>n", "<Plug>(copilot-suggest)")
vim.keymap.set("i", "<A-c>l", "<Plug>(copilot-next)")
vim.keymap.set("i", "<A-c>h", "<Plug>(copilot-previous)")

-- LSP
vim.pack.add({
  gh("neovim/nvim-lspconfig"),
  gh("mason-org/mason.nvim"),
  gh("mason-org/mason-lspconfig.nvim"),
})

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "html",
    "cssls",
    "lua_ls",
    "graphql",
    "vtsls",
    "rnix",
    "gopls",
    "marksman",
  },
  automatic_installation = true,
})

vim.keymap.set("n", "<leader>d", function()
  vim.diagnostic.open_float()
end, { desc = "Show line diagnostics" })

vim.lsp.config("vtsls", {
  single_file_support = false,
  root_dir = getRootDir({ "package.json" }),
})

vim.lsp.config("gopls", {
  cmd = { "gopls", "-remote=auto" },
  settings = {
    gopls = {
      buildFlags = { "-tags=integration" },
      staticcheck = true,
      expandWorkspaceToModule = false,
    },
  },
  root_dir = getRootDir({ "README.md", "main.go", "go.mod", "LICENSE", ".git" }),
  flags = {
    debounce_text_changes = 500,
  },
  init_options = {
    codelenses = {
      generate = true,
      gc_details = true,
      test = true,
      tidy = true,
    },
  },
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})

-- vim.lsp.enable("sourcekit")

-- Completion
vim.pack.add({ {
  src = gh("saghen/blink.cmp"),
  version = "v1.10.2",
} })
require("blink.cmp").setup({
  cmdline = {
    enabled = true,
    completion = {
      menu = { auto_show = true },
    },
    keymap = {
      ["<S-CR>"] = { "select_accept_and_enter", "fallback" },
      ["<Left>"] = { "hide", "fallback" },
      ["<Right>"] = { "accept", "fallback" },
      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
    },
  },
  signature = { enabled = true },
  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = "mono",
  },
  completion = {
    accept = { auto_brackets = { enabled = false } },
    list = {
      selection = { preselect = true, auto_insert = false },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 1000,
    },
  },
  keymap = {
    preset = "none",
    ["<Left>"] = { "hide", "fallback" },
    ["<Right>"] = { "accept", "fallback" },
    ["<Up>"] = { "select_prev", "fallback" },
    ["<Down>"] = { "select_next", "fallback" },
    ["<S-Up>"] = { "scroll_documentation_up", "fallback" },
    ["<S-Down>"] = { "scroll_documentation_down", "fallback" },
    ["<S-Right>"] = { "show", "show_documentation", "hide_documentation", "fallback" },
  },
})

pcall(require, "local")
