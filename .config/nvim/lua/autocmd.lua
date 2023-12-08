local latex = vim.api.nvim_create_augroup("LaTeX", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", { pattern = { "*.tex" }, command = "!pdflatex %", group = latex })
vim.api.nvim_create_autocmd("BufWritePost", { pattern = { "*.tex" }, command = "!bibtex %", group = latex })
vim.api.nvim_create_autocmd("BufWritePost", { pattern = { "*.tex" }, command = "!pdflatex %", group = latex })
