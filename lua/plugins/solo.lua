-- ~/.config/nvim/lua/plugins/solo.lua
return {
  -- Manage Python venvs without leaving Neovim
  {
    "linux-cultist/venv-selector.nvim",
    cmd = { "VenvSelect", "VenvSelectCached" },
    opts = { name = ".venv" }, -- auto-picks .venv if present
  },

  -- Test runner (Pytest) with nice UI
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python")({
            runner = "pytest",
            args = { "-q" },
          }),
        },
      })
    end,
  },

  -- HTTP client inside Neovim for FastAPI endpoints
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    config = function()
      require("rest-nvim").setup({
        highlight = { enabled = true },
        result = { split = { horizontal = true } },
      })
    end,
  },

  -- Database explorer (SQLite) without leaving Neovim
  {
    "tpope/vim-dadbod",
    dependencies = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
    },
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection" },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      -- Example SQLite connection (adjust path if needed):
      -- :let g:db = 'sqlite:./app.db'
    end,
  },

  -- Task runner for common commands (dev server, scripts, etc.)
  {
    "stevearc/overseer.nvim",
    cmd = { "OverseerRun", "OverseerToggle" },
    opts = {},
  },
}
