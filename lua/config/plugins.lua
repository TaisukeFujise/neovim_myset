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
            icons = {
            filetype = { enabled = true },
			separator={left='【', right='】'},
            buffer_index = true,
			button = 'X',
            modified = { button = '●' },
            pinned = { button = '' },
            },
        },
        version='^1.0.0',
    },
    {"akinsho/toggleterm.nvim",
        version="*",
        config = function()
            require("toggleterm").setup({
                open_mapping = [[<C-\>]],
                direction = "float",
					float_opts = {
						border = "curved",
						winblend = 3,
						width= function()
							return math.floor(vim.o.columns * 0.7)
						end,
						height = function()
							return math.floor(vim.o.lines * 0.4)
						end,
					}
            })

            -- Lazygitの設定
            local Terminal = require("toggleterm.terminal").Terminal
            local lazygit = Terminal:new({
                cmd = "lazygit",
                hidden = true,
                direction = "float",
                float_opts = {
                    border = "curved", -- 枠線を丸くする
                    width = function()
						return math.floor(vim.o.columns * 0.9)    -- 最大幅
					end,
                    height = function()
						return math.floor(vim.o.lines * 0.9)   -- 最大高さ
					end,
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
            -- {"<leader>ff", "<cmd>Telescope find_files<cr>", desc="Find files"},
            -- {"<leader>fg", "<cmd>Telescope live_grep<cr>", desc="Live grep"},
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
        tag = "v1.0.0",
        config = function()
            local lspconfig = require("lspconfig")

            -- 1. Lua LSの設定 (vim変数を認識させる)
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })

            -- 2. C/C++ (clangd) の設定
            lspconfig.clangd.setup({})

            -- 3. エラー表示の見た目設定
            vim.diagnostic.config({
                virtual_text = {
                    prefix = '✖ '
                },
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
            })
        end,
    },
	{"wakatime/vim-wakatime", lazy=false},
	{
  		'stevearc/oil.nvim',
  		---@module 'oil'
  		---@type oil.SetupOpts
  		opts = {
				columns={
					"icon",
				}
			},
  		lazy = false,
	},
	{"folke/noice.nvim",
			event="VeryLazy",
			opts={
				cmdline={
					format={
						cmdline={icon=">"},
						search_down={icon="/?"},
						search_up={icon="?"},
						filter={icon="$"},
						lua={icon="lua"},
						help={icon="?"},
					}
				},
				popupmenu={
					kind_icons=false,
					enabled=true,
					backend="cmp",
				},
			},
			dependencies={
				{"MunifTanjim/nui.nvim", pin=true},
				"rcarriga/nvim-notify",
			},
	},
	{"rainbowhxch/accelerated-jk.nvim",
		opts={},
		keys={
				{"j", "<Plug>(accelerated_jk_gj)"},
				{"k", "<Plug>(accelerated_jk_gk)"},
			},
	},
	{
        "folke/snacks.nvim",
        lazy = false,
        priority = 1000,
        keys = {
            { "<leader>ff", function() require("snacks").picker.files()    end, desc = "Find files" },
            { "<leader>fg", function() require("snacks").picker.grep()     end, desc = "Live grep" },
            { "<leader>fb", function() require("snacks").picker.buffers()  end, desc = "Buffers" },
            { "<leader>fr", function() require("snacks").picker.recent()   end, desc = "Recent files" },
            { "<leader>fe", function() require("snacks").picker.explorer() end, desc = "Explorer" },
        },
        ---@type snacks.Config
        opts = {
            dashboard = {
                enabled = true,
                row = 10,
                preset = {
                    keys = {
                        { icon = " ", key = "f", desc = "files",    action = function() require("snacks").picker.files()    end },
                        { icon = " ", key = "r", desc = "recent",   action = function() require("snacks").picker.recent()   end },
                        { icon = " ", key = "g", desc = "grep",     action = function() require("snacks").picker.grep()     end },
                        { icon = " ", key = "e", desc = "explorer", action = function() require("snacks").picker.explorer() end },
                        { icon = " ", key = "q", desc = "quit",     action = ":qa" },
                    },
                },
            },
            picker = {
                layout = {
                    preset = "vertical",
                },
            },
        },
    },
	{"nvim-tree/nvim-tree.lua",
			version="*",
			lazy=false,
			dependencies={
				"nvim-tree/nvim-web-devicons",
			},
			keys={
				{mode="n", "<C-n>", "<cmd>NvimTreeToggle<CR>", desc="NvimTree Toggle"},
				{mode="n", "<C-m>", "<cmd>NvimTreeFocus<CR>", desc="NvimTree Focus"},
			},
			config=function()
				require("nvim-tree").setup{
					update_focused_file={
						enable=true,
						update_root=true,
						ignore_list={},
					},
					git={
						enable=true,
						ignore=true,
					},
					view={
						width=30,
						side="left",
					},
					renderer={
						group_empty=true,
						highlight_git=true,
						highlight_opened_files="all",
					},
					filters={
						dotfiles=true,
					},
				}
			end,
	},
}
