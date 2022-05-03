["null-ls"] = function()

  local status_ok, null_ls = pcall(require, "null-ls")
  if not status_ok then
    return
  end


  local formatting = null_ls.builtins.formatting
  
  local formatting = null_ls.builtins.diagnostics


  null_ls.setup {
    debug = false,
    sources = {
      formatting.black,
      formatting.prettierd,
      diagnostics.eslint,  
    }
    

    on_attach = function(client)
      if client.resolved_capabilities.document_formatting then
        vim.api.nvim_create_autocmd("BufWritePre", {
          desc = "Auto format before save",
          pattern = "<buffer>",
          callback = vim.lsp.buf.formatting_sync,
        })
      end
    end,
  },
end,


require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.diagnostics.eslint,
        require("null-ls").builtins.completion.spell,
    },
})


