return {
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",

    config = function()
        --add treesitter configs
        local configs = require("nvim-treesitter.configs");
        configs.setup({
            ensure_installed = { "c", "lua", "javascript", "html", "css"},        
            highlight = { enable = true },
            indent = { enable = true },  
        }
        )
    end
}
