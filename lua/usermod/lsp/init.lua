local lspconfig_status, lsp = pcall(require, 'lspconfig')
if not lspconfig_status then
	return
end

local function initialize_inlay_hints()
	local clangd_extensions_status, clangd_ext = pcall(require, 'clangd_extensions.inlay_hints')
	if clangd_extensions_status then
		clangd_ext.setup_autocmd()
		clangd_ext.set_inlay_hints()
	end
end

lsp.clangd.setup {
	capabilities = vim.lsp.protocol.make_client_capabilities(),
	on_attach = function(client, bufnr)
		initialize_inlay_hints()
	end,
	root_dir = function(fname)
		local root_files = { 'compile_commands.json' }
		return vim.fs.dirname(vim.fs.find(root_files, { upward = true, path = vim.fs.dirname(fname) })[1])
	end
}
