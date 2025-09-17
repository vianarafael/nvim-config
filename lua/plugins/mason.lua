-- Ensure Mason UI exists and auto-install servers/tools
return {
  { -- :Mason UI
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = { ui = { border = "rounded" } },
  },
  { -- LSP servers via Mason
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    event = "VeryLazy",
    opts = {
      ensure_installed = {
        -- Python
        "pyright",
        "ruff",
        -- Web
        "html",
        "emmet_language_server",
        "tailwindcss",
        "jsonls",
        -- SQL
        "sqlls",
      },
      automatic_installation = true,
    },
  },
  { -- Non-LSP tools (formatters, linters, debug)
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    event = "VeryLazy",
    opts = {
      ensure_installed = {
        "ruff",
        "debugpy",
        "black",
        "isort", -- Python
        "sqlfluff", -- SQL
      },
      run_on_start = true,
      start_delay = 300,
      debounce_hours = 24,
    },
  },
}
