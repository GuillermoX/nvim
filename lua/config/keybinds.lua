vim.g.mapleader = " "
-- Neotree
vim.keymap.set("n", "<leader>e", function()
  if vim.bo.filetype == "neo-tree" then
    vim.cmd("wincmd p") -- "wincmd p" salta a la ventana anterior (tu archivo de código)
  else
    vim.cmd("Neotree focus") -- Si estás en el código, salta a Neo-tree
  end
end, { desc = "Toggle Focus en Neo-tree" })
vim.keymap.set("n", "<leader>cd", ":Neotree toggle<CR>", { desc = "Toggle File Explorer" }) 	-- Show sidebar
