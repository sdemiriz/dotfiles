-- Install Lazy plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

-- Shorthand for importing plugins from own files
function plug(plugin_filename)
    local plugins_dir = "sdemiriz/"
    return require(plugins_dir..plugin_filename)
end

-- PLUGINS
require('lazy').setup({

    -- Nord theme
    plug("nord"),

    -- Easy commenting via "gc" when in visual mode
    plug("comment"),

    -- Show keybinds
    plug("which-key"),

    -- File explorer
    plug("nvim-tree"),

    -- LSP configuration
    plug("nvim-lspconfig"),

    -- Snippets
    plug("nvim-cmp"),

    -- Git signs in gutter
    plug("gitsigns"),

    -- Status line on bottom
    plug("lualine"),

    -- Fuzzy finder
    plug("telescope"),

    -- Treesitter buffer navigator
    plug("treesitter"),

    -- Bufferline display
    plug("bufferline"),

    plug("conform"),

}, {})
