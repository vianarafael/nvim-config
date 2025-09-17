-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.completeopt = { "menu", "menuone" }

-- Optional: set leader to space (comment out if you want '\' instead)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Writer mode toggle
local is_writer = false

local function toggle_writer()
  if not is_writer then
    -- Enter writer mode
    vim.cmd("Goyo") -- distraction-free
    vim.cmd("PencilSoft") -- soft wrap for writing
    vim.o.spell = true -- enable spell check
    is_writer = true
    print("✍️ Writer mode ON")
  else
    -- Exit writer mode
    vim.cmd("Goyo!")
    vim.cmd("PencilOff")
    vim.o.spell = false
    is_writer = false
    print("💻 Coding mode ON")
  end
end

-- Toggle manually with <leader>W (Space+W if you set leader to space)
vim.keymap.set("n", "<leader>W", toggle_writer, { desc = "Toggle Writer Mode" })

-- Auto-enable for Markdown/Text only (optional)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text" },
  callback = function()
    if not is_writer then
      toggle_writer()
    end
  end,
})
