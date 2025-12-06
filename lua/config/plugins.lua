return 
{
	{"windwp/nvim-autopairs", config=true},
	{"lewis6991/gitsigns.nvim", config=true},
       
	{"nvim-treesitter/nvim-treesitter",
		build=":TSUpdate",
		config=function()
			require("nvim-treesitter.configs").setup({
				highlight={enable=true},
                indent={enable=true},
				})
			end,
	},
    {"Diogo-ss/42-header.nvim",
        cmd = { "Stdheader" },
        keys = { "<F1>" },
        opts = {
        default_map = true, -- Default mapping <F1> in normal mode.
        auto_update = true, -- Update header when saving.
        user = "tafujise", -- Your user.
        mail = "tafujise@student.42jp", -- Your mail.
    -- add other options.
        },
  config = function(_, opts)
    require("42header").setup(opts)
  end,
    },
    {"bluz71/vim-moonfly-colors",
            name="moonfly",
            lazy=false,
            priority=1000,
            config=function()
                vim.g.moonflyCursorColor=true
                vim.cmd("colorscheme moonfly")
            end,
    },
}
