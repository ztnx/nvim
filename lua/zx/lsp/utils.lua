local cmp_ok,   cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

if not cmp_ok then
	return
end

local function lsp_keymaps()
	local opts = { noremap = true, silent = true }
	local keymap = vim.keymap.set
	keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	keymap("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	keymap("n", "gR", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
	keymap("n", "<leader>li", "<cmd>LspInfo<cr>", opts)
	keymap("n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
	keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
	keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
	keymap("n", "]e", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
	keymap("n", "[e", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
	keymap("n", "gr", "Lspsaga rename<cr>", opts)
	keymap("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	keymap("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
end

local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)

M.setup = function()
	local signs = {

		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		virtual_text = false, -- disable virtual text
		signs = {
			active = signs, -- show signs
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})

	lsp_keymaps()
end

M.on_attach = function(client, bufnr)
	if client.name == "tsserver" then
		client.server_capabilities.document_formatting = false
	end

	if client.name == "sumneko_lua" then
		client.server_capabilities.document_formatting = false
	end

	if client.name == "rust-analyzer" then
    local ok, rt = pcall(require, "rust-tools")
    if not ok then
      return
    end

		vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
		vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
	end

	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end

	illuminate.on_attach(client)
end

return M
