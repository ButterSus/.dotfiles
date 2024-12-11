return {
{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
{
    'nvim-lualine/lualine.nvim',
    options = {
	    icons_enabled = true,
	    theme = 'palenight'
    },
    dependencies = { 
	    'nvim-tree/nvim-web-devicons' 
    }
},
{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
}
}
