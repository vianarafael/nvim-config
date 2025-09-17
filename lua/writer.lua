local M = {}
local saved

local function apply(opts)
  for scope, kv in pairs(opts) do
    for k, v in pairs(kv) do
      if scope == "wo" then
        vim.wo[k] = v
      elseif scope == "bo" then
        vim.bo[k] = v
      else
        vim.o[k] = v
      end
    end
  end
end

local function snapshot()
  return {
    wo = {
      number = vim.wo.number,
      relativenumber = vim.wo.relativenumber,
      signcolumn = vim.wo.signcolumn,
      wrap = vim.wo.wrap,
      linebreak = vim.wo.linebreak,
      spell = vim.wo.spell,
      colorcolumn = vim.wo.colorcolumn,
      conceallevel = vim.wo.conceallevel,
    },
    bo = {
      textwidth = vim.bo.textwidth,
    },
  }
end

function M.on()
  if saved then
    return
  end
  saved = snapshot()
  require("zen-mode").open()
  vim.cmd("PencilSoft") -- from vim-pencil
  apply({
    wo = {
      number = false,
      relativenumber = false,
      signcolumn = "no",
      wrap = true,
      linebreak = true, -- wrap by words
      spell = true,
      colorcolumn = "",
      conceallevel = 2, -- nice Markdown look
    },
    bo = { textwidth = 80 },
  })
end

function M.off()
  if not saved then
    return
  end
  require("zen-mode").close()
  vim.cmd("PencilOff")
  apply(saved)
  saved = nil
end

function M.toggle()
  if saved then
    M.off()
  else
    M.on()
  end
end

return M
