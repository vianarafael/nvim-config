-- ~/.config/nvim/lua/plugins/writer.lua
return {
  { "junegunn/goyo.vim", cmd = "Goyo" },
  { "preservim/vim-pencil", cmd = { "Pencil", "PencilSoft", "PencilOff" } },
  { "iamcco/markdown-preview.nvim", build = "cd app && yarn install", ft = { "markdown" } },
}
