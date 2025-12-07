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
    {"romgrk/barbar.nvim",
        dependencies={
                "lewis6991/gitsigns.nvim",
                "nvim-tree/nvim-web-devicons",
            },
            init=function()
                vim.g.barbar_auto_setup=false
            end,
        opts = {
            animation = true,
        -- アイコンを無効化またはテキストに変更する設定
            icons = {
            -- ファイルタイプアイコン（nvim-web-devicons）を無効化
            filetype = { enabled = false },
            
            -- バッファの状態を示すアイコンを一般的な記号に変更
            buffer_index = true, -- バッファ番号を表示するかどうか
            modified = { button = '[+]' },
            pinned = { button = '[Pin]' },
            -- 必要に応じて他のアイコンもテキストに置き換える
            },
        },
        version='^1.0.0',
    },
    {"akinsho/toggleterm.nvim",
        version="*",
        config = function()
            require("toggleterm").setup({
                open_mapping = [[<C-\>]], 
                direction = "horizontal",
            })

            -- Lazygitの設定
            local Terminal = require("toggleterm.terminal").Terminal
            local lazygit = Terminal:new({
                cmd = "lazygit",
                hidden = true,
                direction = "float",
                float_opts = {
                    border = "curved", -- 枠線を丸くする
                    width = 100000,    -- 最大幅
                    height = 100000,   -- 最大高さ
                },
                on_open = function(_)
                    vim.cmd("startinsert!") -- 開いたらすぐ操作可能にする
                end,
                on_close = function(_)
                    vim.cmd("startinsert!")
                end,
            })

            -- トグル用の関数を定義
            function _lazygit_toggle()
                lazygit:toggle()
            end

            -- キーマッピングを設定 (leader + lg)
            vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
        end
    },
    {"nvim-telescope/telescope.nvim",
        dependencies={"nvim-lua/plenary.nvim"},
        cmd="Telescope",
        keys={
            {"<leader>ff", "<cmd>Telescope find_files<cr>", desc="Find files"},
            {"<leader>fg", "<cmd>Telescope live_grep<cr>", desc="Live grep"},
        },
        opts={
            defaults={
                prompt_prefix="> ",
                selection_prefix="> ",
                sorting_strategy="ascending",
                layout_strategy="horizontal",
                layout_config={width=0.9, height=0.8},
            },
        },
    },
    {"neovim/nvim-lspconfig",
        tag="v1.0.0",
        config=function()
            local lspconfig=require("lspconfig")
            lspconfig.lua_ls.setup({})
            lspconfig.clangd.setup({})
        end,
    }
}
