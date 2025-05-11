local status_ok_mason, mason_nvim = pcall(require, "mason")
if not status_ok_mason then
  print("mason failed loading...")
  return
end

local status_ok_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_mason_lspconfig then
  print("mason-lspconfig failed loading...")
  return
end

local status_ok_nvim_lspconfig, nvim_lspconfig = pcall(require, "lspconfig")
if not status_ok_nvim_lspconfig then
  print("nvim-lspconfig failed loading...")
  return
end

mason_nvim.setup({})
mason_lspconfig.setup({
   ensure_installed = {
      "lua_ls"
   }
})
nvim_lspconfig.lua_ls.setup({})

vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
